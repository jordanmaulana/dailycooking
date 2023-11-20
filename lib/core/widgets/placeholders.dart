import 'package:flutter/material.dart';

import 'buttons.dart';
import 'texts.dart';

class VError extends StatelessWidget {
  final String errorMsg;
  final Function() onRetry;
  const VError(
    this.errorMsg, {
    required this.onRetry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: VText(errorMsg, align: TextAlign.center),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 120,
            child: VButton(
              'Coba lagi',
              onTap: () {
                onRetry();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NoData extends StatelessWidget {
  final String? text;

  const NoData({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VText(
      text ?? 'Tidak ada data',
      align: TextAlign.center,
    );
  }
}
