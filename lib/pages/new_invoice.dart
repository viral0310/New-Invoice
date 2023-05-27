import 'package:flutter/material.dart';
import 'package:my_invoice_app/contants/Strings.dart';
import 'package:my_invoice_app/contants/colors.dart';

class NewInvoice extends StatefulWidget {
  const NewInvoice({Key? key}) : super(key: key);

  @override
  State<NewInvoice> createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  List<Map<String, dynamic>> alldata = [
    {
      'icon': Icons.indeterminate_check_box,
      'title': 'Invoice ID',
      'subtitle': 'add Date',
      'routes': '/invoice_id'
    },
    {
      'icon': Icons.inventory_rounded,
      'title': 'Your details',
      'subtitle': 'add your business details',
      'routes': '/your_details'
    },
    {
      'icon': Icons.people_alt,
      'title': 'Invoice to',
      'subtitle': 'add payer',
      'routes': '/invoice_to',
    },
    {
      'icon': Icons.shopping_cart_rounded,
      'title': 'Items',
      'subtitle': 'add items to your invoice',
      'routes': '/items'
    },
    {
      'icon': Icons.payment_outlined,
      'title': 'Payment',
      'subtitle': 'add payment instruction',
      'routes': '/payment',
    },
    {
      'icon': Icons.draw,
      'title': 'Signature',
      'subtitle': 'sign your invoice',
      'routes': '/signature'
    },
  ];
  // late Invoice I;
  List<Invoice> allInvoices = [];

  @override
  void iniState() {
    super.initState();

    allInvoices = alldata.map((e) => Invoice.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          "New Invoice",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.clear_sharp,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.kSecondaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: alldata.map((data) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(data['routes']);
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        height: 125,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ListTile(
                                leading: Icon(
                                  data['icon'],
                                  size: 30,
                                ),
                                title: Text(data['title'],
                                    style: TextStyle(fontSize: 18)),
                                subtitle: Text(data['subtitle'],
                                    style: TextStyle(fontSize: 16)),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
