import 'dart:async';

import 'package:im_web/app/app.dart';

class SalesInvoiceViewModel {
  static late SalesInvoiceViewModel _instance;

  factory SalesInvoiceViewModel(App app) {
    _instance = SalesInvoiceViewModel._internal();
    return _instance;
  }

  SalesInvoiceViewModel._internal() {
    _init();
  }

  static List<String> additionalItemsList = [];
  static List<String> additionalAmountList = [];

  static List<String> contactsList = ["One","Two","Three","Four"];

  void _init(){

  }
}