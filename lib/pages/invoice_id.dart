import 'package:flutter/material.dart';
import 'package:my_invoice_app/contants/colors.dart';

import '../contants/Global.dart';

class InvoiceId extends StatefulWidget {
  const InvoiceId({Key? key}) : super(key: key);

  @override
  State<InvoiceId> createState() => _InvoiceIdState();
}

class _InvoiceIdState extends State<InvoiceId> {
  TextStyle tStyle = TextStyle(fontSize: 18);
  final GlobalKey<FormState> invoice_id_formkey = GlobalKey<FormState>();
  final TextEditingController date_controller = TextEditingController();
  final TextEditingController invoice_id_controller = TextEditingController();
  InputDecoration textFormFieldDeco(String data) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
      focusColor: AppColors.kSecondaryColor,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 18,
        //fontWeight: FontWeight.bold,
      ),
      hintText: "${data}",
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
        title: Text("Invoce ID"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: invoice_id_formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invoice ID",
                style: tStyle,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your Invoice Id first....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.invoice_Id = val;
                  });
                },
                cursorColor: AppColors.kPrimaryColor,
                controller: invoice_id_controller,
                decoration: textFormFieldDeco("#12345678"),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Date",
                style: tStyle,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your Date first....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.date = val;
                  });
                },
                keyboardType: TextInputType.datetime,
                controller: date_controller,
                cursorColor: AppColors.kPrimaryColor,
                decoration: textFormFieldDeco("DD/MM/YYYY"),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: AppColors.kPrimaryColor,
                          padding: const EdgeInsets.all(10.0)),
                      onPressed: () {
                        if (invoice_id_formkey.currentState!.validate()) {
                          invoice_id_formkey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("All data successfully saved..."),
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
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: AppColors.kPrimaryColor,
                          padding: const EdgeInsets.all(10.0)),
                      onPressed: () {
                        invoice_id_formkey.currentState!.reset();
                        invoice_id_controller.clear();
                        date_controller.clear();

                        setState(() {
                          Global.invoice_Id = "";
                          Global.date = "";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("All data successfully cleared..."),
                          backgroundColor: AppColors.kPrimaryColor,
                          behavior: SnackBarBehavior.floating,
                        ));
                      },
                      child: Text(
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
    );
  }
}
