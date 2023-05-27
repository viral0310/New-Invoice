import 'dart:io';
import 'dart:typed_data';

import 'Strings.dart';

class Global {
  //invoice id
  static String? invoice_Id;
  static String? date;
  //your_details
  static String? business_name;
  static String? email;
  static String? phone;
  static String? address;
  static File? image;
  //invoice_to
  static String? payer_name;
  static String? payer_email;
  static String? payer_phone;
  static String? payer_address;
  //add_new_item dailogbox
  static String? item_name;
  static double? item_cost;
  static int? item_quantity;
  static List<Item> item_details_list = [];
  static int? total;
  static List? total_List;
  static double sum = 0;
  static List<String> tableList = [
    'Name',
    'Item cost',
    'Quantity',
    'Total',
    'Actions'
  ];
  static List<String> pdftableList = [
    'Name',
    'Item cost',
    'Quantity',
    'Total',
  ];

  //payment instruction
  static String? note;
  static File? SignatureImage;

  //Signature
  static Uint8List? signature;
}
