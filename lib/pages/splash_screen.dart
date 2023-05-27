import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_invoice_app/contants/Strings.dart';

import '../contants/colors.dart';
import '';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/img.png",
              height: 90,
              width: 90,
              color: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              AppStrings.App_Name,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              AppStrings.App_Dis,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home_page');
              },
              color: Colors.white,
              child: const Text(
                AppStrings.App_Start_But,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
