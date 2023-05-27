import 'package:flutter/material.dart';

import '../contants/Global.dart';
import '../contants/colors.dart';

class InvoiceTo extends StatefulWidget {
  const InvoiceTo({Key? key}) : super(key: key);

  @override
  State<InvoiceTo> createState() => _InvoiceToState();
}

class _InvoiceToState extends State<InvoiceTo> {
  TextStyle tStyle = const TextStyle(fontSize: 18);
  final GlobalKey<FormState> invoice_to_formkey = GlobalKey<FormState>();
  final TextEditingController payer_Name_controller = TextEditingController();
  final TextEditingController payer_email_controller = TextEditingController();
  final TextEditingController payer_phone_controller = TextEditingController();
  final TextEditingController payer_address_controller =
      TextEditingController();
  InputDecoration textFormFieldDeco = InputDecoration(
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    focusColor: AppColors.kSecondaryColor,
    hintStyle: const TextStyle(
        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
    hintText: "",
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kSecondaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(4.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text("New Payer"),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
          child: Form(
            key: invoice_to_formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payer Name",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your payer name first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.payer_name = val;
                    });
                  },
                  cursorColor: AppColors.kPrimaryColor,
                  controller: payer_Name_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Email address",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your email address first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.payer_email = val;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.kPrimaryColor,
                  controller: payer_email_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Phone number",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your phone number first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.payer_phone = val;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.kPrimaryColor,
                  controller: payer_phone_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Address",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your address first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(
                      () {
                        Global.payer_address = val;
                      },
                    );
                  },
                  cursorColor: AppColors.kPrimaryColor,
                  controller: payer_address_controller,
                  decoration: textFormFieldDeco,
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: AppColors.kPrimaryColor,
                            padding: const EdgeInsets.all(10.0)),
                        onPressed: () {
                          if (invoice_to_formkey.currentState!.validate()) {
                            invoice_to_formkey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  const Text("All data successfully saved..."),
                              backgroundColor: AppColors.kPrimaryColor,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: AppColors.kPrimaryColor,
                          padding: const EdgeInsets.all(10.0),
                        ),
                        onPressed: () {
                          invoice_to_formkey.currentState!.reset();
                          payer_Name_controller.clear();
                          payer_email_controller.clear();
                          payer_phone_controller.clear();
                          payer_address_controller.clear();

                          setState(
                            () {
                              Global.payer_name = "";
                              Global.payer_email = "";
                              Global.payer_phone = "";
                              Global.payer_address = "";
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("All data successfully cleared..."),
                            backgroundColor: AppColors.kPrimaryColor,
                            behavior: SnackBarBehavior.floating,
                          ));
                        },
                        child: const Text(
                          "CLEAR",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
