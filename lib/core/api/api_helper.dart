import '../../main.dart';

class ApiHelper {
  ApiHelper._();

  static const String token = 'token';
  static const String baseUrl = 'baseUrl';

  static setStorage(String key, String value) async {
    await box.write(key, value);
  }

  static getStorage(String key) {
    return box.read(key);
  }
}
