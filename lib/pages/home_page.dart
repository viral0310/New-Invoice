import 'package:flutter/material.dart';
import 'package:my_invoice_app/contants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Invoices",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        backgroundColor: AppColors.kSecondaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/new_invoice');
            },
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pdf');
              },
              icon: Icon(
                Icons.picture_as_pdf_rounded,
                size: 25,
                color: Colors.black,
              ))
        ],
      ),
      body: const Center(
        child: Text(
          "YOU DONT HAVE ANY INVOICES!",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
