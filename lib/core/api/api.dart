import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/utilities.dart';
import 'api_helper.dart';
import 'api_list_response.dart';
import 'api_response.dart';
import 'api_url.dart';

export 'api_list_response.dart';
export 'api_response.dart';
export 'api_url.dart';

const contentType = 'application/json; charset=UTF-8';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 30);
    String? baseUrl = ApiHelper.getStorage(ApiHelper.baseUrl);
    httpClient.baseUrl = 'https://${baseUrl ?? ApiUrl.baseUrl}';

    httpClient.addRequestModifier<void>((request) async {
      // String? token = await ApiHelper.getStorage(ApiHelper.token);
      // if (token != null)

      ///TODO: Replace later
      request.headers['apikey'] = '1445d8b4ac130e2ead366cbea64055f0';

      return request;
    });

    httpClient.addResponseModifier((request, response) {
      Get.log('Api ${request.method} ${request.url} : ${response.statusCode}');
      Get.log(VUtils.getPrettyJSONString(request.headers));
      Get.log(VUtils.getPrettyJSONString(response.body));

      return response;
    });
    super.onInit();
  }

  Future<ApiResponse> postApi(
      {required String url,
      required body,
      Map<String, String>? headers}) async {
    Response response = await post(
      url,
      body,
      contentType: contentType,
      headers: headers,
    );
    Get.log(VUtils.getPrettyJSONString(body));
    if (response.status.hasError) {
      if (!response.status.connectionError) report(url, response, params: body);
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> putApi({required String url, required body}) async {
    Response? response;
    response = await put(
      url,
      body,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (!response.status.connectionError) report(url, response, params: body);
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> patchApi({required String url, required body}) async {
    Response? response;
    response = await patch(
      url,
      body,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (!response.status.connectionError) report(url, response, params: body);
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> delApi({required String url}) async {
    Response? response;
    response = await delete(
      url,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (!response.status.connectionError) {
        report(url, response, params: {'url': url});
      }
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  Future<dynamic> getApi(
      {required String url, param, bool list = false}) async {
    Response? response;
    response = await get(
      url,
      query: param,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (!response.status.connectionError) {
        report(url, response, params: param);
      }
      return list
          ? ApiListResponse(
              errorMsg: errorHandler(response),
              response: response,
            )
          : ApiResponse(errorMsg: errorHandler(response), response: response);
    }
    return list
        ? ApiListResponse.fromResponse(response)
        : ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> multipartApi({
    required String url,
    Map<String, dynamic>? body,
    File? file,
    String? fileKey = 'render',
  }) async {
    Map<String, dynamic> data = body ?? {};
    if (file != null) {
      data[fileKey!] = MultipartFile(
        file,
        filename: file.path,
        contentType: 'image/png',
      );
    }
    Response? response;
    response = await put(
      url,
      FormData(data),
      headers: {'Accept': '*/*'},
      contentType: 'multipart/form-data',
    );
    if (response.status.hasError) {
      if (!response.status.connectionError) report(url, response);
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> multipart(
      {required String url,
      Map<String, dynamic>? body,
      File? file,
      Function(int bytes, int totalBytes)? onUploadProgress}) async {
    var request = MultipartRequest(
        'POST', Uri.parse('https://${ApiUrl.baseUrl}$url'),
        onProgress: onUploadProgress);
    String? token = await ApiHelper.getStorage(ApiHelper.token);
    request.headers["Authorization"] = "Bearer $token";
    request.headers['Content-Type'] = 'multipart/form-data';
    Map<String, String> data =
        body!.map((key, value) => MapEntry(key, value!.toString()));
    request.fields.addAll(data);
    request.files.add(http.MultipartFile(
        'file', file!.openRead(), file.lengthSync(),
        filename: file.path));
    var send = await request.send().timeout(const Duration(seconds: 120));
    var res = await send.stream.transform(utf8.decoder).join();
    Response response =
        Response(statusCode: send.statusCode, body: jsonDecode(res));
    if (response.status.hasError) {
      if (!response.status.connectionError) report(url, response);
      return ApiResponse(
        errorMsg: errorHandler(response),
        response: response,
      );
    }
    return ApiResponse.fromResponse(response);
  }

  String errorHandler(Response? response) {
    if (response == null) {
      return 'Terjadi kesalahan';
    }

    switch (response.statusCode) {
      case 400:
        final stringBuffer = StringBuffer();
        var data = response.body;
        data.forEach((key, value) {
          if (key == 'non_field_errors') {
            stringBuffer.writeln(value[0]);
          } else {
            stringBuffer.writeln('$value');
          }
        });
        return stringBuffer.toString();
      case 403:
        return 'Tidak ada akses';
      case 404:
        return 'Halaman tidak ditemukan';
      case 500:
        return 'Layanan sedang diperbaiki';
      default:
        return 'Terjadi kesalahan';
    }
  }
}

class MultipartRequest extends http.MultipartRequest {
  final Function(int bytes, int totalBytes)? onProgress;

  MultipartRequest(
    String method,
    Uri url, {
    this.onProgress,
  }) : super(method, url);

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();
    if (onProgress == null) return byteStream;
    final total = contentLength;
    int bytes = 0;
    return http.ByteStream(byteStream.map((chunk) {
      bytes += chunk.length;
      onProgress!(bytes, total);
      return chunk;
    }));
  }
}

report(String url, Response response, {dynamic params}) async {
  if (params != null &&
      (params is! FormData) &&
      params.containsKey('password')) {
    params?.remove('password');
  }

  /// Optional
  /// Add error reporting feature
}
