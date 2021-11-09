import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_generator/controllers/home_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() => QrImage(
                    data: controller.qrcode.value,
                    size: 200,
                  )),
              TextFormField(
                controller: controller.qrCodeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "QR Code"),
                onChanged: (v) {
                  //whatever will be written here will be assigned to qrcode variable
                  controller.qrcode.value = v;
                },
              ),
              MaterialButton(
                  onPressed: () {
                    controller.scanQR();
                  },
                  color: Colors.blue,
                  child: Text("Scan QR Code"))
            ],
          )),
    );
  }
}
