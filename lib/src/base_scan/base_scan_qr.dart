import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BaseScanQR extends StatelessWidget {
  const BaseScanQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: QrImage(
        data: "1234567890",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
