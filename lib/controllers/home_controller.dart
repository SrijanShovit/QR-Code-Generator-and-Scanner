import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController qrCodeController = TextEditingController();

  //making it reactive  or observable with .obs
  var qrcode = "".obs;

  String scannedQrCode = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> scanQR() async {
    try {
      scannedQrCode = await FlutterBarcodeScanner.scanBarcode(
          // lineColor
          '#ff6666',
          //  cancelButtonText
          'Cancel',
          //  isShowFlashIcon
          true,
          // scanMode
          ScanMode.QR);
      if (scannedQrCode != "-1") {
        Get.snackbar("Result", scannedQrCode, backgroundColor: Colors.green);
      }
      print('-------------------' + scannedQrCode);
    }
    //for platform related exceptions
    on PlatformException {
      Get.snackbar("Error", scannedQrCode, backgroundColor: Colors.red);
    }
  }
}
