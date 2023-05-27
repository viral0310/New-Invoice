import 'package:flutter/material.dart';
import '../contants/Global.dart';
import '../contants/Strings.dart';
import '../contants/colors.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  TextStyle tStyle = const TextStyle(fontSize: 18);

  final GlobalKey<FormState> add_new_item_formkey = GlobalKey<FormState>();
  final TextEditingController item_name_controller = TextEditingController();
  final TextEditingController item_cost_controller = TextEditingController();
  final TextEditingController item_quantity_controller =
      TextEditingController();

  String? name;
  double? cost;
  int? quantity;

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

  int? total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text("Iterms List"),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: (Global.item_details_list.isEmpty)
            ? Center(
                child: Text(
                  "You did not add any item yet!",
                  style: tStyle,
                ),
              )
            : Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        //width: 450,

                        child: Row(
                          children: Global.tableList
                              .map(
                                (e) => Container(
                                  height: 50,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Center(child: Text(e)),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Column(
                        children: Global.item_details_list
                            .map(
                              (e) => Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Center(child: Text(e.item_Name)),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child:
                                        Center(child: Text('${e.item_Cost}')),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                        child: Text('${e.item_Quantity}')),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                          '${e.item_Cost * e.item_Quantity}'),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 72,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            Global.item_details_list.removeAt(
                                                Global.item_details_list
                                                    .indexOf(e));
                                          });
                                        },
                                        icon: Icon(Icons.delete,
                                            color: AppColors.red)),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 1.5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  /*  Row(
                    children: Global.item_details_list.map((e) {
                      return Text("${e.item_Cost * e.item_Quantity}");
                    }).toList(),
                  ),*/
                  Text(
                    "                   Total         ${Global.sum}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            //barrierColor: Colors.pinkAccent.withOpacity(0.5),
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Center(child: Text("Add new item")),
              content: SizedBox(
                height: 292,
                /* padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),*/
                child: Form(
                  key: add_new_item_formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item Name",
                        style: tStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your item name first....";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        cursorColor: AppColors.kPrimaryColor,
                        controller: item_name_controller,
                        decoration: textFormFieldDeco,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Item cost",
                        style: tStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your item cost first....";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            cost = double.parse(val!);
                          });
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.kPrimaryColor,
                        controller: item_cost_controller,
                        decoration: textFormFieldDeco,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Quantity",
                        style: tStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your quantity first....";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            quantity = int.parse(val!);
                          });
                        },
                        keyboardType: TextInputType.phone,
                        cursorColor: AppColors.kPrimaryColor,
                        controller: item_quantity_controller,
                        decoration: textFormFieldDeco,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
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
                          if (add_new_item_formkey.currentState!.validate()) {
                            add_new_item_formkey.currentState!.save();
                            Item i1 = Item(
                                item_Cost: cost as double,
                                item_Name: name as String,
                                item_Quantity: quantity as int);

                            setState(() {
                              Global.item_details_list.add(i1);
                            });
                            setState(() {
                              List t = [];
                              Global.item_details_list.map((e) {
                                Global.sum = e.item_Cost * e.item_Quantity;
                                t.add(Global.sum);
                                print(t);
                              }).toList();
                              Global.sum = t.fold(
                                  0, (previous, current) => previous + current);
                              //print(t);
                            });
                            Navigator.of(context).pop();
                            add_new_item_formkey.currentState!.reset();
                            item_name_controller.clear();
                            item_cost_controller.clear();
                            item_quantity_controller.clear();

                            // List t = [];

                            setState(() {
                              name = "";
                              cost = 0;
                              quantity = 0;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    "All data successfully saved..."),
                                backgroundColor: AppColors.kPrimaryColor,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
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
                          add_new_item_formkey.currentState!.reset();
                          item_name_controller.clear();
                          item_cost_controller.clear();
                          item_quantity_controller.clear();

                          setState(() {
                            name = "";
                            cost = 0;
                            quantity = 0;
                            // Global.item_name_List.removeAt();
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
          );
        },
        backgroundColor: AppColors.kPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
