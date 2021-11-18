// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'dart:convert';
class GeneralVoucherDataModel {
  String? displayVoucherNumber;
  String? voucherNumber;
  DateTime? voucherDate;
  String? voucherPrefix;
  String? invoiceNumber;
  DateTime? invoiceDate;
  DateTime? dateCreated;
  DateTime? timestamp;
  DateTime? lastEditedDateTime;

  // LedgerMasterDataModel? ledgerObject = LedgerMasterDataModel();
  // List<CompoundItemDataModel>? InventoryItems = [];
  // List<InventoryItemDataModel>? deletedItems = [];
//  List<LedgerMasterDataModel>? ledgersList = [];
  String? narration;
  String? priceListId;
  String? priceListName;
  double? discount = 0;
  double? discountPercent = 0;
  double? subTotal = 0;
  double? grossTotal = 0;
  double? discountinAmount = 0;
  double? grandTotal = 0;
  double? taxTotalAmount = 0;
  double? otherLedgersTotal = 0;
  double? cessAmount = 0;
  double? cgstTotal = 0;
  double? sgstTotal = 0;
  double? currencyConversionRate = 1;
  String? currency;
  String? ProjectId;
  String? AddedBy;
  int? AddedById = 0;
  DateTime? DeliveryDate;
  double? CompletionProbability = 100;
  int? CreditPeriod = 0;
  int? RevisionNo = 0;
  String? ConvertedToSalesOrder = "";
  bool? QuotationPrepared;
  bool? QuotationDropped;
  String? QuotationDroppedReason;
  int? SalesmanID = 0;
  String? TermsAndConditionsID;
  String? RequirementVoucherNo;
  var Contact;
  String? LPO = "";
  String? BillingName;
  String? prevTransVouchers = "";
  double? roundOff = 0;
  int? status = 10;
  String? voucherType;
  bool? ManagerApprovalStatus = false;
  bool? ClientApprovalStatus = false;
  int? Pax = 0;
  int? NoOfCopies = 0;
  int? ModeOfService = 0;
  double? quantityTotal = 0;
  double? balanceAmount = 0;
  double? paidAmount = 0;
  String? reference;
  String? Location;
  String? POCName;
  String? POCEmail;
  String? POCPhone;
  String? kotNumber;
  bool? BillSplit = false;
  bool? paymentSplit = false;
  double? cashPaid = 0;
  double? balance = 0;
  String? fromGodownName;
  String? toGodownName;
  String? fromGodownID; //fromGodownID
  String? toGodownID; // toGodownID
//  QList<BillwiseRecordDataModel*> mapList;
//  ChequeDetail chequeEntry;

  double? crTotal = 0;
  double? drTotal = 0;
  double? ledgersTotal = 0;
  bool? fromExternal = false;
  bool? sendFlag = false;
  bool? voucherToExport = false;
  String? TransactionId;
  int? action;
  var CustomerExpectingDate;

  // NOT DONE
  String? LRNO;
  int? numBoxes = 0;
  double? totalWeight = 0;
  int? Origin = 0;

//    String Currency;
  int? currencyDecimalPoints = 2;
  var ReqVoucherList;

  GeneralVoucherDataModel({
    this.displayVoucherNumber,
    this.voucherNumber,
    this.voucherDate,
    this.voucherPrefix,
    this.invoiceNumber,
    this.invoiceDate,
    this.dateCreated,
    this.timestamp,
    this.lastEditedDateTime,
    // this.ledgerObject,
    //  this.InventoryItems,
    // this.deletedItems,
    //  this.ledgersList,
    this.narration,
    this.priceListId,
    this.priceListName,
    this.discount,
    this.discountPercent,
    this.subTotal,
    this.grossTotal,
    this.discountinAmount,
    this.grandTotal,
    this.taxTotalAmount,
    this.otherLedgersTotal,
    this.cessAmount,
    this.currencyConversionRate,
    this.currency,
    this.ProjectId,
    this.AddedBy,
    this.AddedById,
    this.DeliveryDate,
    this.CompletionProbability,
    this.CreditPeriod,
    this.RevisionNo,
    this.ConvertedToSalesOrder,
    this.QuotationPrepared,
    this.QuotationDropped,
    this.QuotationDroppedReason,
    this.SalesmanID,
    this.TermsAndConditionsID,
    this.RequirementVoucherNo,
    this.Contact,
    this.LPO,
    this.BillingName,
    this.prevTransVouchers,
    this.roundOff,
    this.status,
    this.voucherType,
    this.ManagerApprovalStatus,
    this.ClientApprovalStatus,
    this.Pax,
    this.NoOfCopies,
    this.ModeOfService,
    this.quantityTotal,
    this.balanceAmount,
    this.paidAmount,
    this.reference,
    this.Location,
    this.POCName,
    this.POCEmail,
    this.POCPhone,
    this.kotNumber,
    this.BillSplit,
    this.paymentSplit,
    this.cashPaid,
    this.balance,
    this.toGodownName,
    this.crTotal,
    this.drTotal,
    this.ledgersTotal,
    this.fromExternal,
    this.sendFlag,
    this.voucherToExport,
    this.TransactionId,
    this.action,
    this.CustomerExpectingDate,
    this.LRNO,
    this.numBoxes,
    this.totalWeight,
    this.Origin,
    this.currencyDecimalPoints,
    this.ReqVoucherList,
    this.fromGodownID,
    this.toGodownID,
  });

  Map<String, dynamic> toMapForTransTest() {
    return {
      'Voucher_Date': voucherDate?.millisecondsSinceEpoch,
      'Voucher_Prefix': voucherPrefix,
      'Voucher_Type': voucherType,
      'Voucher_No': voucherNumber ?? '',
      'Narration': narration,
      'reference': reference,
      'POC_Phone': POCPhone,
      'DeliveryDate': DeliveryDate?.millisecondsSinceEpoch,
      // 'InventoryItems':
      // InventoryItems?.map((e) => e.toMapForTransTest()).toList(),
      // 'ledgerObject': ledgerObject?.toMapForTransTest(),
      // 'ledgersList': ledgersList?.map((e) => e.toMapForTransTest()).toList(),
      'Location': Location,
      'grandTotal': grandTotal,
      'grossTotal': grossTotal,
      'status': 115,
      'ModeOfService': ModeOfService,
      'vatAmount': taxTotalAmount,
      'BillingName': BillingName,
      'Salesman_ID': SalesmanID,
      'toGodownID': toGodownID,
      'fromGodownID': fromGodownID,
    };
  }

  factory GeneralVoucherDataModel.fromMapForTransTest(
      Map<String, dynamic> map) {
    // print('voucher : $map');

    // print(
    //     'Date is HERE : ${map['Voucher_Date']} as ${DateTime.fromMillisecondsSinceEpoch(int.parse(map['Voucher_Date'] ?? '0'))}');
    DateTime vDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['Voucher_Date'] ?? '0') * 1000);

    // print(
    //     'Timestamp  is HERE : ${map['TimeStamp']} as ${DateTime.fromMillisecondsSinceEpoch(int.parse(map['TimeStamp'] ?? '0'))}');

    // print('Led List : ${map['ledgersList']}');

    print('vat is ${map['vatAmount'].runtimeType}');
    //if (map == null) return null;

    GeneralVoucherDataModel v = GeneralVoucherDataModel(
      voucherNumber: map['Voucher_No'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['TimeStamp'] ?? '0') * 1000),
      voucherDate: vDate,
      voucherPrefix: map['Voucher_Prefix'],
      //  InventoryItems: map['InventoryItems'] != null
      //       ? List<CompoundItemDataModel>.from(
      //    map['InventoryItems']?.map(
      //           (x) => CompoundItemDataModel.fromMapForTransTest(x),
      //     ),
      //   )[],
      narration: map['Narration'] ?? '',
      voucherType: map['Voucher_Type'],
      grandTotal: double.parse(map['grandTotal'] ?? "0"),
      grossTotal: double.parse(map['grossTotal'] ?? "0"),
      paymentSplit: map['paymentSplit'] ?? false,
      // taxTotalAmount: ,
      POCPhone: map['POC_Phone'] ?? '',
      Location: map['Location'] ?? '',
      DeliveryDate: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['DeliveryDate'] ?? '0') * 1000),
      //ledgerObject: LedgerMasterDataModel.fromMapGen(map['ledgerObject']),
      status: 110,
      ModeOfService: int.parse(map['ModeOfService'] ?? '0'),
      taxTotalAmount: double.parse(map['vatAmount'] ?? '0'),
      BillingName: map['BillingName'] ?? '',
      SalesmanID: int.parse(map['Salesman_ID'] ?? '0'),

      // ledgersList: (map['ledgersList'] == null)
      //      ? []
      //      : List<LedgerMasterDataModel>.from(
      //    map['ledgersList']?.map(
      //          (x) => LedgerMasterDataModel.fromMapGen(x),
      //    ),
      //  ),
      toGodownID: map['toGodownID'] ?? '',
      fromGodownID: map['fromGodownID'] ?? '',
    );

    print('returning VouCher : ${v.voucherNumber}');

    return v;
  }

  Map<String, dynamic> toMapForBox() {
    return {
      'Voucher_Date': voucherDate?.millisecondsSinceEpoch.toString(),
      'Voucher_Prefix': voucherPrefix,
      'Voucher_Type': voucherType,
      'Voucher_No': voucherNumber ?? '',
      'Narration': narration,
      'reference': reference,
      // 'InventoryItems': InventoryItems?.map((e) => e.toMapForBoxt()).toList(),
      // 'ledgerObject': ledgerObject?.toMapForTransTest(),
      //'ledgersList': ledgersList?.map((e) => e.toMapForTransTest()).toList(),
      'grandTotal': grandTotal.toString(),
      'discountPercent': discountPercent.toString(),
      'grossTotal': grossTotal.toString(),
      'vatAmount': taxTotalAmount.toString(),
    };
  }

  factory GeneralVoucherDataModel.fromMapForBox(Map<String, dynamic> map) {
    print('voucher : $map');

    DateTime vDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['Voucher_Date'] ?? '0')); //*1000

    DateTime dDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['DeliveryDate'] ?? '0'));

    print(vDate);
    // if (map == null) return null;
    return GeneralVoucherDataModel(
      voucherNumber: map['Voucher_No'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(map['TimeStamp'] ?? '0') * 1000),
      voucherDate: vDate,
      //DateTime.parse(map['Voucher_Date']),
      //DateTime.fromMillisecondsSinceEpoch(map['Voucher_Date']),
      voucherPrefix: map['Voucher_Prefix'],
      // InventoryItems: (map['InventoryItems'] == null)
      //     ? List<CompoundItemDataModel>()
      //     : List<CompoundItemDataModel>.from(
      //         map['InventoryItems']?.map(
      //           (x) => CompoundItemDataModel.fromMapForTransTest(x),
      //         ),
      //       ),
      // InventoryItems: List<CompoundItemDataModel>.from(
      //   map['InventoryItems']?.map(
      //         (x) => CompoundItemDataModel.fromMapForTransTest(x),
      //   ),
      // ),
      taxTotalAmount: double.parse(map['vatAmount'] ?? "0"),
      grossTotal: double.parse(map['grossTotal'] ?? "0"),
      discountPercent: double.parse(map['discountPercent'] ?? "0"),
      narration: map['Narration'],
      voucherType: map['Voucher_Type'],
      grandTotal: double.parse(map['grandTotal'].toString()),
      // DeliveryDate: DateTime.parse(map['DeliveryDate'] ?? '2000-01-21'),
      DeliveryDate: dDate,
      // ledgerObject:
      //     LedgerMasterDataModel.fromMapGen(map['ledgerObject'] ?? null),
      // ledgersList: (map['ledgersList'] == null)
      //     ? []
      //     : List<LedgerMasterDataModel>.from(
      //         map['ledgersList']?.map(
      //           (x) => LedgerMasterDataModel.fromMapGen(x),
      //         ),
      //       ),
    );
  }

  String toJson() => json.encode(toMapForTransTest());

  factory GeneralVoucherDataModel.fromJson(String source) =>
      GeneralVoucherDataModel.fromMapForTransTest(json.decode(source));

  // num getItemCount(String itemID) {
  //   double count = 0;
  //   InventoryItems!.forEach((element) {
  //     if (element.BaseItem.itemID == itemID) {
  //       count += element.BaseItem.quantity!.toDouble();
  //     }
  //   });
  //   return count;
  // }

  // int getFirstIndexOfItem(String itemID) {
  //   for (int i = 0; i < InventoryItems!.length; i++) {
  //     if (InventoryItems![i].BaseItem.itemID == itemID) return i;
  //   }
  //   return -1;
  // }

  void calculateVoucherSales() {
    subTotal = 0;
    taxTotalAmount = 0;
    discountinAmount = 0;
    grossTotal = 0;
    cessAmount = 0;
    paidAmount = 0;
    grandTotal = 0;

    //for (var i in ledgersList) {
    //print('ledger name ${i.LedgerName} crAmount ${i.crAmount}');
    //}
    Map<String, double> LedgersListTemp = Map();
    quantityTotal = 0;
    // print('above for loop 563');
//     for (int i = 0; i < InventoryItems!.length; i++) {
//       double vatAmt = 0;
//       double vatamtBy_2 = 0;
//       double taxRate = 0;
//       double subT = 0;
//       double grandTotolItem = 0;
//       double itemCess = 0;
//
//       InventoryItems![i].BaseItem.crQty = InventoryItems![i].BaseItem.quantity;
//
//       quantityTotal = InventoryItems![i].BaseItem.quantity!;
//       taxRate = InventoryItems![i].BaseItem.taxRate!;
//       //        subT = voucher->InventoryItems[i].BaseItem.price *voucher->InventoryItems[i].BaseItem.quantity ;
//       subT = ((InventoryItems![i].BaseItem.price)! *
//           InventoryItems![i].BaseItem.quantity!);
//
//       grandTotolItem = subT - InventoryItems![i].BaseItem.discountinAmount!;
//
//       //        voucher->discountinAmount += voucher->InventoryItems[i].BaseItem.discountinAmount;
//       //        // qDebug()<<"Discount in Amount : "<<voucher->InventoryItems[i].BaseItem.discountinAmount;
//
//       // print('taxRate >= 0');
//       if (taxRate >= 0) {
//         vatAmt = grandTotolItem * taxRate / 100;
//         vatamtBy_2 = grandTotolItem * taxRate / 200;
//         cgstTotal = (cgstTotal! + vatamtBy_2);
//         sgstTotal = (sgstTotal! + vatamtBy_2);
//         vatAmt = double.parse(vatAmt.toStringAsFixed(2));
//       }
//       // print('taxRate > 5<3');
//       if (taxRate > 5 && ledgerObject!.tRN!.length < 3) {
//         itemCess = grandTotolItem * 1 / 100;
//         // itemCess = QString::number(itemCess,'f',2).toFloat();
//         cessAmount = (cessAmount! + itemCess);
//       }
//
//       subTotal = (subTotal! + subT);
//       grossTotal = (grossTotal! + grandTotolItem);
//
//       discountinAmount =
//       (discountinAmount! + InventoryItems![i].BaseItem.discountinAmount!);
//
//       String salesLedgerID = "";
//       String cgstLedgerID = "";
//       String sgstLedger = "";
//
//       print('taxRate==0');
//       if (taxRate == 0) {
//         salesLedgerID = "0x7x3";
//       } else if (taxRate == 5) {
//         salesLedgerID = "0x7xSV5";
//         cgstLedgerID = "0x2x14xOCG25";
//         sgstLedger = "0x2x14xOSG25";
//       } else if (taxRate == 12) {
//         salesLedgerID = "0x7xSV12";
//         cgstLedgerID = "0x2x14xOCG6";
//         sgstLedger = "0x2x14xOSG6";
//       } else if (taxRate == 18) {
//         salesLedgerID = "0x7xSV18";
//         cgstLedgerID = "0x2x14xOCG9";
//         sgstLedger = "0x2x14xOSG9";
//       } else if (taxRate == 28) {
//         salesLedgerID = "0x7xSV28";
//         cgstLedgerID = "0x2x14xOCG14";
//         sgstLedger = "0x2x14xOSG14";
//       }
//       // print('Sales Ledgers');
//       //Sales Ledgers
//       if (LedgersListTemp.keys.contains(salesLedgerID)) {
//         LedgersListTemp[salesLedgerID] =
//         (LedgersListTemp[salesLedgerID]! + grandTotolItem);
//       } else {
//         if (salesLedgerID.length > 0)
//           LedgersListTemp[salesLedgerID] = grandTotolItem;
//       }
//
//       // print('CGST');
//       //CGST
//       if (LedgersListTemp.keys.contains(cgstLedgerID)) {
//         LedgersListTemp[cgstLedgerID] = (LedgersListTemp[cgstLedgerID]! +
//             vatamtBy_2); //.toStringAsFixed(2) as double;
//
//         taxTotalAmount =
//         (taxTotalAmount! + vatamtBy_2); //.toStringAsFixed(2) as double;
//       } else {
//         if (cgstLedgerID.length > 0) {
//           LedgersListTemp[cgstLedgerID] =
//               vatamtBy_2; //.toStringAsFixed(2) as double;
//           taxTotalAmount =
//           (taxTotalAmount! + vatamtBy_2); //.toStringAsFixed(2) as double;
//         }
//       }
//       // print('SGST');
//       //SGST
//       if (LedgersListTemp.keys.contains(sgstLedger)) {
//         LedgersListTemp[sgstLedger] = (LedgersListTemp[sgstLedger]! +
//             vatamtBy_2); //.toStringAsFixed(2) as double;
//         taxTotalAmount =
//         (taxTotalAmount! + vatamtBy_2); //.toStringAsFixed(2) as double;
//       } else {
//         if (sgstLedger.length > 0) {
//           LedgersListTemp[sgstLedger] =
//               vatamtBy_2; //.toStringAsFixed(2) as double;
//
//           taxTotalAmount =
//           (taxTotalAmount! + vatamtBy_2); //.toStringAsFixed(2) as double;
//         }
//       }
//
//       InventoryItems![i].BaseItem.subTotal = subT; //+vatAmt;
// //        // qDebug()<<"tax amt update"<<voucher->InventoryItems[i].BaseItem.taxAmount;
//       InventoryItems![i].BaseItem.taxAmount = vatAmt;
// //        // qDebug()<<"tax amt updated to"<<voucher->InventoryItems[i].BaseItem.taxAmount;
//       InventoryItems![i].BaseItem.grandTotal = grandTotolItem + vatAmt;
//     }

    subTotal = subTotal;
    grossTotal = (subTotal! - discountinAmount!);

    grandTotal = grossTotal! + taxTotalAmount! + cessAmount!;

    //    // qDebug()<<"Grand Total : "<<voucher->grandTotal;

    // if (cessAmount! > 0 && ledgerObject!.tRN!.length < 1) {
    //   LedgersListTemp["0x2x14xCess"] = cessAmount!;
    // }
    //
    // // print('isInvoiceItem');
    //
    // for (int i = 0; i < ledgersList!.length; i++) {
    //   // print('${ledgersList[i].LedgerID} is ${ledgersList[i].isInvoiceItem}}');
    //   if (ledgersList![i].isInvoiceItem!) {
    //     ledgersList?.removeAt(i);
    //     i--;
    //   }
    // }
    //
    // // print('pay split is : $paymentSplit');

    // for (int i = 0; i < ledgersList!.length; i++) {
    //   print('$i th elem is ${ledgersList![i].LedgerID}');
    //
    //   grandTotal = grandTotal! + ledgersList![i].crAmount!;
    // }
    // print('total Now : $grandTotal');
    //   LedgersListTemp.forEach((key, value) {
    //     LedgerMasterDataModel ledger = LedgerMasterDataModel();
    //     ledger.crAmount = value;
    //     ledger.amount = value;
    //     ledger.LedgerID = key;
    //     ledger.isInvoiceItem = true;
    //     // ledger.LedgerName = ledHelper.getLedgerNameByID(ledger.LedgerID);
    //     ledgersList!.add(ledger);
    //   });
    //
    //   double round = grandTotal!.roundToOne;
    //   print('Round = $round');
    //   roundOff = round - grandTotal!;
    //   //    qDebug()<<"Round off : "<<voucher->roundOff << "Total : "<<voucher->grandTotal;
    //
    //   LedgerMasterDataModel roundledger = LedgerMasterDataModel();
    //   // print('roundOff > 0');
    //   if (roundOff! > 0) {
    //     roundledger.crAmount = roundOff;
    //   } else {
    //     roundledger.drAmount = (-roundOff!);
    //   }
    //
    //   roundledger.LedgerID = "0x12x11";
    //   roundledger.isInvoiceItem = true;
    //   if (roundOff != 0) {
    //     // print('718');
    //     roundledger.amount = roundOff;
    //     roundledger.LedgerName = "Round Off";
    //     ledgersList!.add(roundledger);
    //     grandTotal = (grandTotal! + roundOff!);
    //   }
    //   balanceAmount = (grandTotal! - paidAmount!);
    //   crTotal = 0;
    //   drTotal = 0;
    //   ledgersList?.forEach((element) {
    //     // print('element.crAmount =${element.crAmount}');
    //     // print('element.drAmount =${element.drAmount}');
    //     crTotal = crTotal! + element.crAmount!;
    //     drTotal = drTotal! + element.drAmount!;
    //   });
    //   // print('cr total is $crTotal');
    //   // print('calculate voucher sales ended for ${ledgerObject.LedgerID}');
    //   print('ledgers Count : ${ledgersList?.length}');
    // }
  }
}