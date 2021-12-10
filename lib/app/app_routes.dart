import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/screens/cash_bank/cash_bank_screen.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';
import 'package:im_web/screens/expenses/create_expenses.dart';
import 'package:im_web/screens/expenses/expenses_screen.dart';
import 'package:im_web/screens/items/create_item.dart';
import 'package:im_web/screens/items/items_screen.dart';
import 'package:im_web/screens/parties/create_party.dart';
import 'package:im_web/screens/parties/parties_screen.dart';
import 'package:im_web/screens/purchase/payment_out/payment_out.dart';
import 'package:im_web/screens/purchase/payment_out/record_payment_out.dart';
import 'package:im_web/screens/purchase/purchase_invoices/create_purchase_invoice.dart';
import 'package:im_web/screens/purchase/purchase_invoices/purchase_invoices.dart';
import 'package:im_web/screens/purchase/purchase_order/create_purchase_order.dart';
import 'package:im_web/screens/purchase/purchase_order/purchase_order.dart';
import 'package:im_web/screens/purchase/purchase_return/create_purchase_return.dart';
import 'package:im_web/screens/purchase/purchase_return/purchase_return.dart';
import 'package:im_web/screens/sales/delivery_challan/create_delivary_challan.dart';
import 'package:im_web/screens/sales/delivery_challan/delivery_challan.dart';
import 'package:im_web/screens/sales/payment_in/payment_in.dart';
import 'package:im_web/screens/sales/payment_in/record_payment_in.dart';
import 'package:im_web/screens/sales/quotation/create_quotation.dart';
import 'package:im_web/screens/sales/quotation/quotation.dart';
import 'package:im_web/screens/sales/sales_invoices/create_sales_invoice.dart';
import 'package:im_web/screens/sales/sales_invoices/sales_invoice.dart';
import 'package:im_web/screens/sales/sales_return/create_sales_return.dart';
import 'package:im_web/screens/sales/sales_return/sales_return.dart';

class AppRoutes{
  //home pages
  static const String APP_HOME = '/home';
  static const String APP_DASHBOARD = '/dashboard';
  static const String APP_PARTIES = '/parties';
  static const String APP_ITEMS = '/items';
  static const String APP_INVOICE = '/invoice';
  static const String APP_PURCHASES = '/purchases';
  static const String APP_EXPENSES = '/expenses';
  static const String APP_CASH_BANK = '/cash-bank';
  static const String APP_SALES_INVOICE = '/sales/sales-invoice';
  static const String APP_ADD_SALES_INVOICE = '/sales-invoice/add-sales-invoice';
  static const String APP_QUOTATION = '/sales/quotation';
  static const String APP_ADD_QUOTATION = '/sales-invoice/add-quotation';
  static const String APP_PAYMENT_IN = '/sales/payment-in';
  static const String APP_ADD_PAYMENT_IN = '/sales-invoice/add-payment-in';
  static const String APP_SALES_RETURN = '/sales/sales-return';
  static const String APP_ADD_SALES_RETURN = '/sales-invoice/add-sales-return';
  static const String APP_DELIVERY_CHALLAN = '/sales/delivery-challan';
  static const String APP_ADD_DELIVERY_CHALLAN = '/sales-invoice/add-delivery-challan';
  static const String APP_PURCHASE_INVOICE = '/purchase/purchase-invoice';
  static const String APP_ADD_PURCHASE_INVOICE = '/purchase/add-purchase-invoice';
  static const String APP_PAYMENT_OUT = '/purchase/payment-out';
  static const String APP_ADD_PAYMENT_OUT = '/purchase/add-payment-out';
  static const String APP_PURCHASE_RETURN = '/purchase/purchase-return';
  static const String APP_ADD_PURCHASE_RETURN = '/purchase/add-purchase-return';
  static const String APP_PURCHASE_ORDER = '/purchase/purchase-order';
  static const String APP_ADD_PURCHASE_ORDER = '/purchase/add-purchase-order';

  static const String APP_ADD_PARTY = '/parties/add-party';
  static const String APP_ADD_ITEM = '/items/add-item';
  static const String APP_ADD_EXPENSE = '/expenses/add-expense';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ADD_PURCHASE_RETURN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreatePurchaseReturn(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_PURCHASE_ORDER:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreatePurchaseOrder(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_PAYMENT_OUT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => RecordPaymentOut(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_PURCHASE_INVOICE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreatePurchaseInvoice(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_PAYMENT_IN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => RecordPaymentIn(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_DELIVERY_CHALLAN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateDeliveryChallan(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_SALES_RETURN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateSalesReturn(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_QUOTATION:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateQuotation(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_SALES_INVOICE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateSalesInvoice(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_EXPENSE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateExpenses(),
            fullscreenDialog: true,
          );
        }
      case APP_SALES_INVOICE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SalesInvoiceScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_QUOTATION:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => QuotationScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_SALES_RETURN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => SalesReturnScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PAYMENT_IN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PaymentInScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_DELIVERY_CHALLAN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => DeliveryChallanScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PAYMENT_OUT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PaymentOutScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PURCHASE_INVOICE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PurchaseInvoiceScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PURCHASE_RETURN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PurchaseReturnScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PURCHASE_ORDER:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PurchaseOrderScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_ITEM:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateItem(),
            fullscreenDialog: true,
          );
        }
      case APP_ADD_PARTY:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CreateParty(),
            fullscreenDialog: true,
          );
        }
      case APP_EXPENSES:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ExpensesScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_CASH_BANK:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => CashBankScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_ITEMS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ItemsScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PARTIES:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PartiesScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_DASHBOARD:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => DashboardScreen(),
            fullscreenDialog: true,
          );
        }
      default:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Container(),
            fullscreenDialog: true,
          );
        }
    }
  }

  getWidget(BuildContext context, String appRouteName) {
    switch (appRouteName) {
      case APP_ADD_SALES_INVOICE:
        {
          return CreateSalesInvoice();
        }
      case APP_ADD_SALES_RETURN:
        {
          return CreateSalesReturn();
        }
      case APP_ADD_DELIVERY_CHALLAN:
        {
          return CreateDeliveryChallan();
        }
      case APP_ADD_QUOTATION:
        {
          return CreateQuotation();
        }
      case APP_ADD_PAYMENT_IN:
        {
          return RecordPaymentIn();
        }
      case APP_ADD_PURCHASE_INVOICE:
        {
          return CreatePurchaseInvoice();
        }
      case APP_ADD_PURCHASE_RETURN:
        {
          return CreatePurchaseReturn();
        }
      case APP_ADD_PURCHASE_ORDER:
        {
          return CreatePurchaseOrder();
        }
      case APP_ADD_PAYMENT_OUT:
        {
          return RecordPaymentOut();
        }
      case APP_ADD_EXPENSE:
        {
          return CreateExpenses();
        }
      case APP_SALES_INVOICE:
        {
          return SalesInvoiceScreen();
        }
      case APP_SALES_RETURN:
        {
          return SalesReturnScreen();
        }
      case APP_PURCHASE_INVOICE:
        {
          return PurchaseInvoiceScreen();
        }
      case APP_PURCHASE_RETURN:
        {
          return PurchaseReturnScreen();
        }
      case APP_PURCHASE_ORDER:
        {
          return PurchaseOrderScreen();
        }
      case APP_PAYMENT_IN:
        {
          return PaymentInScreen();
        }
      case APP_PAYMENT_OUT:
        {
          return PaymentOutScreen();
        }
      case APP_DELIVERY_CHALLAN:
        {
          return DeliveryChallanScreen();
        }
      case APP_QUOTATION:
        {
          return QuotationScreen();
        }
      case APP_ADD_ITEM:
        {
          return CreateItem();
        }
      case APP_ADD_PARTY:
        {
          return CreateParty();
        }
      case APP_EXPENSES:
        {
          return ExpensesScreen();
        }
      case APP_CASH_BANK:
        {
          return CashBankScreen();
        }
      case APP_ITEMS:
        {
          return ItemsScreen();
        }
      case APP_PARTIES:
        {
          return PartiesScreen();
        }
      case APP_DASHBOARD:
        {
          return DashboardScreen();
        }
      default:
        {
          return Container();
        }
    }
  }

}