import 'package:flutter/material.dart';

import '../contants/Global.dart';
import '../contants/colors.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextStyle tStyle = const TextStyle(fontSize: 18);
  final GlobalKey<FormState> payment_instruction_formkey =
      GlobalKey<FormState>();
  final TextEditingController note_controller = TextEditingController();

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
        title: const Text("Payment Instruction"),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: payment_instruction_formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Note",
                style: tStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your note first....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.note = val;
                  });
                },
                maxLines: 6,
                cursorColor: AppColors.kPrimaryColor,
                controller: note_controller,
                decoration: textFormFieldDeco,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: AppColors.kPrimaryColor,
                        /* padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 40),*/
                      ),
                      onPressed: () {
                        if (payment_instruction_formkey.currentState!
                            .validate()) {
                          payment_instruction_formkey.currentState!.save();
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
                        /*  padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35),*/
                      ),
                      onPressed: () {
                        payment_instruction_formkey.currentState!.reset();
                        note_controller.clear();

                        setState(() {
                          Global.note = "";
                        });

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
                  const SizedBox(
                    width: 5,
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
