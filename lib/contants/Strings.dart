class AppStrings {
  // SplashScreens
  static const String App_Name = "INVOICE GENERATOR";
  static const String App_Dis = "send professional invoices to your clients...";
  static const String App_Start_But = "START";
}

class Invoice {
  final String icon;
  final String title;
  final String subtitle;

  Invoice({required this.icon, required this.title, required this.subtitle});

  factory Invoice.fromMap(Map<String, dynamic> rawInvoice) {
    return Invoice(
      icon: rawInvoice['icon'],
      title: rawInvoice['title'],
      subtitle: rawInvoice['subtitle'],
    );
  }
}

class Item {
  final String item_Name;
  final double item_Cost;
  final int item_Quantity;
  late double? item_total;
  Item({
    required this.item_Name,
    required this.item_Cost,
    required this.item_Quantity,
    this.item_total,
  });
}
