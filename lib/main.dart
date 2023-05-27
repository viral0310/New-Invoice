import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_invoice_app/contants/colors.dart';
import 'package:my_invoice_app/pages/home_page.dart';
import 'package:my_invoice_app/pages/invoice_id.dart';
import 'package:my_invoice_app/pages/invoice_to.dart';
import 'package:my_invoice_app/pages/items.dart';
import 'package:my_invoice_app/pages/new_invoice.dart';
import 'package:my_invoice_app/pages/payment.dart';
import 'package:my_invoice_app/pages/pdf.dart';
import 'package:my_invoice_app/pages/signature.dart';
import 'package:my_invoice_app/pages/splash_screen.dart';
import 'package:my_invoice_app/pages/your_details.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: AppColors.kSecondaryColor,
      //textTheme: GoogleFonts.nunito('nunito'),
    ),
    initialRoute: '/',
    routes: {
      '/': (Context) => SplashScreen(),
      '/home_page': (Context) => HomePage(),
      '/new_invoice': (Context) => NewInvoice(),
      '/invoice_id': (context) => InvoiceId(),
      '/your_details': (context) => YourDetails(),
      '/invoice_to': (context) => InvoiceTo(),
      '/items': (context) => Items(),
      '/payment': (context) => Payment(),
      '/signature': (context) => SignaturePage(),
      '/pdf': (context) => Pdf_Page(),
    },
  ));
}
