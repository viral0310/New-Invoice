import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:my_invoice_app/contants/colors.dart';
import 'package:permission_handler/permission_handler.dart';

import '../contants/Global.dart';

class Utils {
  static final List<Flushbar> flushBars = [];

  static void showSnackBar(
    BuildContext context, {
    required String text,
    required Color color,
  }) =>
      _show(
        context,
        Flushbar(
          messageText: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          )),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: color,
          animationDuration: const Duration(microseconds: 0),
        ),
      );

  static Future _show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();

    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}

class SignaturePreviewPage extends StatelessWidget {
  final Uint8List signature;

  const SignaturePreviewPage({
    Key? key,
    required this.signature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          leading: const CloseButton(),
          title: const Text('Store Signature'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                // storeSignature(context);
                Global.signature = signature;
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Center(
          child: Image.memory(signature, width: double.infinity),
        ),
      );

  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';

    final result = await ImageGallerySaver.saveImage(signature, name: name);
    final isSuccess = result['isSuccess'];

    if (isSuccess) {
      Navigator.pop(context);

      Utils.showSnackBar(
        context,
        text: 'Saved to signature folder',
        color: AppColors.kPrimaryColor,
      );
    } else {
      Utils.showSnackBar(
        context,
        text: 'Failed to save signature',
        color: Colors.red,
      );
    }
  }
}
