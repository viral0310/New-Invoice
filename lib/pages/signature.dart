import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_invoice_app/pages/signature_preview.dart';
import 'package:signature/signature.dart';
import 'package:dotted_border/dotted_border.dart';

import '../contants/Global.dart';
import '../contants/colors.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  late SignatureController controller;
  final ImagePicker _picker = ImagePicker();
/*
  @override
  void initState() {
    super.initState();

    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }
*/

/*  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.kPrimaryColor,
          title: const Text("Signature"),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          child: InkWell(
            onTap: () async {
              XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
              setState(() {
                Global.SignatureImage = File(pickedFile!.path);
              });
            },
            child: Center(
              child: DottedBorder(
                padding: EdgeInsets.all(5),
                borderType: BorderType.Rect,
                color: AppColors.kPrimaryColor,
                child: SizedBox(
                  height: 200,
                  width: 300,
                  child: (Global.SignatureImage != null)
                      ? Image.file(
                          Global.SignatureImage!,
                          fit: BoxFit.cover,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add your Signature",
                              //style: tStyle,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildSwapOrientation() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final newOrientation =
            isPortrait ? Orientation.landscape : Orientation.portrait;

        controller.clear();
        setOrientation(newOrientation);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPortrait
                  ? Icons.screen_lock_portrait
                  : Icons.screen_lock_landscape,
              size: 40,
            ),
            const SizedBox(width: 12),
            const Text(
              'Tap to change signature orientation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          saveButton(),
          const SizedBox(
            width: 10,
          ),
          clearButton(),
        ],
      );
  Widget saveButton() => Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: AppColors.kPrimaryColor,
            /* padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 40),*/
          ),
          onPressed: () async {
            if (controller.isNotEmpty) {
              final signature = await exportSignature();

              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SignaturePreviewPage(signature: signature!),
              ));

              controller.clear();
            }
          },
          child: const Text(
            "SAVE",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );

  Widget clearButton() => Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: AppColors.kPrimaryColor,
              padding: const EdgeInsets.all(10.0)),
          onPressed: () => controller.clear(),
          child: const Text(
            "CLEAR",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );

  Widget buildCheck(BuildContext context) => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.check, color: Colors.green),
        onPressed: () async {
          if (controller.isNotEmpty) {
            final signature = await exportSignature();

            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignaturePreviewPage(signature: signature!),
            ));

            controller.clear();
          }
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: controller.points,
    );

    final signature = await exportController.toPngBytes();
    exportController.dispose();

    return signature;
  }

  void setOrientation(Orientation orientation) {
    if (orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}
