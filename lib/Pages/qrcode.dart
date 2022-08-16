import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quickalert/quickalert.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/Pages/home_page.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final GlobalKey _globalKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? result;
  int onSelectedIndex = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    readQR();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (() => Navigator.of(context).pop()),
        ),
        title: Text("Scan QR"),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.camera),
            onPressed: () async {
              reassemble();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(),
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Text('Flash ${snapshot.data}');
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text(
                              'Camera facing ${describeEnum(snapshot.data!)}');
                        } else {
                          return const Text('loading');
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 400,
              width: 400,
              child: QRView(
                cameraFacing: CameraFacing.back,
                key: _globalKey,
                onQRViewCreated: qrScanner,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: (result != null)
                    ? Text(
                        "${result!.code!}",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 25, color: Colors.white),
                      )
                    : Text(
                        "Scan a Code",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 30, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
            ),
            label: "Scanner",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_sharp,
            ),
            label: "Generator",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: onSelectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        iconSize: 30,
        onTap: tapSelected,
      ),
    );
  }

  void tapSelected(int index) {
    setState(() {
      onSelectedIndex = index;
    });
  }

  void readQR() {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }

  void qrScanner(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.resumeCamera();
      setState(() {
        result = scanData;
      });

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "Login Berhasil",
        autoCloseDuration: Duration(seconds: 10),
        onCancelBtnTap: () => Navigator.of(context).pop(),
      );
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
