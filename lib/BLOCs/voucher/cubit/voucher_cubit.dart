import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/datamodels/transaction/generalVoucherDataModel.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  VoucherCubit({
  this.web,
  this.voucherType,
  this.link,
  this.getVoucherLink,
  this.settingsBox,}) : super(VoucherInitial());
  final Box? settingsBox;
  final WebserviceHelper? web;
  final String? voucherType;
  final String ?link;
  String ?getVoucherLink; // =
  // 'stock_journal_webservice.php?action=getvoucherbyvoucherno';

  final inwardVoucher = false;
  final transVoucher = true;

  void getEmptyVoucher({
    String defLedID = '',
    String defLedName = '',
    String fromGodownID = '',
    String toGodownID = '',
  }) {
    print('To Gdown : $toGodownID');
    print('FROM Gdown : $fromGodownID');
    // String pref = Hive.box('settings').get('VoucherPrefix');
    final GeneralVoucherDataModel voucher = GeneralVoucherDataModel();
    // voucher.InventoryItems = [];
    voucher.voucherDate = DateTime.now();
    voucher.voucherPrefix =
        Hive.box('settings').get('vPref', defaultValue: 'A');

    voucher.voucherType = voucherType;
    // voucher.ledgersList = [];
    // voucher.ledgerObject = LedgerMasterDataModel();
    // voucher.ledgerObject!.LedgerID = defLedID;
    //voucher.ledgerObject!.LedgerName = defLedName;
    voucher.SalesmanID = settingsBox!.get('Salesman_ID', defaultValue: 1);
    voucher.fromGodownID = fromGodownID;
    voucher.toGodownID = toGodownID;
    emit(VoucherReady(voucher: voucher));
  }

  Future<bool> saveVoucher(GeneralVoucherDataModel voucher) async {
    try {
      // if (voucher.ledgerObject == null) {
      //   print('Led Obj is Null');
      //   return false;
      // }
      // print(
      //     'hellovdis ${voucher.discountPercent} ledger is ${voucher.ledgerObject!.LedgerID}');
      // await web?.sendVoucher(voucher, link!, voucherType!);
    } catch (e) {
      emit(VoucherSaveError(error: 'Error'));
      return false;
    }
    emit(VoucherSaved());
    getEmptyVoucher();
    // emit(VoucherReady(voucher: voucher));
    return true;
  }

  // Future<bool> saveReceipt(GeneralVoucherDataModel voucher) async {
  //   try {
  //     if (voucher.ledgerObject == null) {
  //       voucher.ledgerObject = new LedgerMasterDataModel();
  //       voucher.ledgersList = [];
  //     }
  //     print('hellovdis ${voucher.discountPercent}');
  //     web!.sendreceipt(voucher, link!);
  //   } catch (e) {
  //     emit(VoucherSaveError(error: 'Error'));
  //     return false;
  //   }
  //   emit(VoucherSaved());
  //   emit(VoucherReady(voucher: voucher));
  //   return true;
  // }

  //Future<bool> savePaymentVoucher(GeneralVoucherDataModel voucher) async {
  // try {
  //   // ignore: prefer_conditional_assignment
  //   if (voucher.ledgerObject == null) {
  //     voucher.ledgerObject = new LedgerMasterDataModel();
  //     // voucher.ledgersList = [];
  //   }
  //   print('ledlist ${voucher.ledgersList}');
  //   // print('hellovdis ${voucher.discountPercent}');
  //   // voucher.voucherType = 'PAYMENTVOUCHER';
  //   web!.sendpayment(voucher, link!);
  // } catch (e) {
  //   emit(VoucherSaveError(error: 'Error'));
  //   return false;
  // }
  // emit(VoucherSaved());
  // emit(VoucherReady(voucher: voucher));
  // return true;
  // }

  Future<bool> deleteVoucher(GeneralVoucherDataModel voucher) async {
    return true;
  }

// void addItemByQty({InventoryItemDataModel? item, double? quantity = 1}) {
//   final voucher = (state as VoucherReady).voucher;
//   if (voucher.getItemCount(item!.itemID!) == 0) {
//     print('item Adding');
//     item.quantity = quantity;
//     item.currentQty = quantity;
//     item.prevQty = 0;
//     item.crQty = quantity;
//     print('Appedning');
//     voucher.InventoryItems?.add(CompoundItemDataModel(BaseItem: item));
//     print('Item Added');
//   } else {
//     for (int i = 0; i < voucher.InventoryItems!.length; i++) {
//       print('running loop $i');
//       if (voucher.InventoryItems![i].BaseItem.itemID == item.itemID) {
//         print(
//             'Found Item at $i wit OLD qty :${voucher.InventoryItems![i].BaseItem.quantity} will add ');
//         voucher.InventoryItems![i].BaseItem.quantity! + quantity!!= quantity;
//         voucher.InventoryItems![i].BaseItem.currentQty! + quantity!= quantity;
//         voucher.InventoryItems![i].BaseItem.crQty! + quantity!= quantity;
//         print(
//             'Break at $i wit new qty :${voucher.InventoryItems![i].BaseItem.quantity}');
//         break;
//       }
//     }
//   }
//   voucher.calculateVoucherSales();
//   print('Calc Completed');
//
//   emit(VoucherReady(voucher: voucher));
//   print('Item count Increased');
//   return;
// }
//
// void updateItemQuantityAtIndex({required double quantity, required int index}) {
//   final voucher = (state as VoucherReady).voucher;
//   if (voucher.InventoryItems!.length > index) {
//     voucher.InventoryItems![index].BaseItem.quantity = quantity;
//     emit(VoucherReady(
//       voucher: voucher,
//     ));
//   }
// }

// void updateItemQty({ InventoryItemDataModel? item, double quantity = 1}) {
//   final voucher = (state as VoucherReady).voucher;
//   if (voucher.getItemCount(item!.itemID!) == 0) {
//     if (quantity == 0) return;
//     item.quantity = quantity;
//     item.currentQty = quantity;
//     item.prevQty = 0;
//     item.crQty = quantity;
//     voucher.InventoryItems!.add(CompoundItemDataModel(BaseItem: item));
//   } else {
//     for (int i = 0; i < voucher.InventoryItems!.length; i++) {
//       if (voucher.InventoryItems![i].BaseItem.itemID == item.itemID) {
//         if (item.quantity == 0) {
//           voucher.InventoryItems!.removeAt(i);
//         } else {
//           voucher.InventoryItems![i].BaseItem.quantity = quantity;
//           voucher.InventoryItems![i].BaseItem.currentQty = quantity;
//           voucher.InventoryItems![i].BaseItem.crQty = quantity;
//         }
//         break;
//       }
//     }
//   }
//   voucher.calculateVoucherSales();
//   print('Calc Completed');
//   emit(VoucherReady(voucher: voucher));
//   print('Item count Increased');
//   return;
// }
//
// void deleteItemByQty(String itemID) {
//   final voucher = (state as VoucherReady).voucher;
//   for (int i = 0; i < voucher.InventoryItems!.length; i++) {
//     print('I value : $i');
//     if (voucher.InventoryItems![i].BaseItem.itemID == itemID) {
//       voucher.InventoryItems![i].BaseItem.quantity=voucher.InventoryItems![i].BaseItem.quantity!-1;
//       voucher.InventoryItems![i].BaseItem.currentQty=(voucher.InventoryItems![i].BaseItem.currentQty!-1);
//       voucher.InventoryItems![i].BaseItem.crQty=voucher.InventoryItems![i].BaseItem.crQty!-1;
//       if (voucher.InventoryItems![i].BaseItem.quantity == 0)
//         voucher.InventoryItems?.removeAt(i);
//       break;
//     }
//   }
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
//   print('Item count reduced');
//
//   return;
// }
//
// void addItem(InventoryItemDataModel item) {
//   CompoundItemDataModel comp = CompoundItemDataModel(BaseItem: item);
//   final voucher = (state as VoucherReady).voucher;
//   voucher.InventoryItems?.add(comp);
//   emit(VoucherRefreshing());
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }
//
// void setLedgerObject(LedgerMasterDataModel led) {
//   print('Setting Ledger Object <<<<<<<<<<<<<');
//   final voucher = (state as VoucherReady).voucher;
//   voucher.ledgerObject = led;
//   // emit(VoucherRefreshing());
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }
//
// void setNarration(String narration) {
//   print('Setting Narration Object <<<<<<<<<<<<<');
//   final voucher = (state as VoucherReady).voucher;
//   voucher.narration = narration;

//
//   emit(VoucherReady(voucher: voucher));
// }

// void addledger(LedgerMasterDataModel item) {
//   //CompoundItemDataModel comp = CompoundItemDataModel(BaseItem: );
//   print('in add ledger');
//   final voucher = (state as VoucherReady).voucher;
//   voucher.ledgersList?.add(item);
//   // print('v led ${voucher.ledgersList}');
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }

// void deleteledger(int row) {
//   final voucher = (state as VoucherReady).voucher;
//   if (voucher.ledgersList!.length < row) return;
//   print('delete at $row size : ${voucher.ledgersList!.length}');
//   voucher.ledgersList!.removeAt(row);
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }

// void deleteItem(int row) {
//   final voucher = (state as VoucherReady).voucher;
//   if (voucher.InventoryItems!.length > row) return;
//   voucher.InventoryItems!.removeAt(row);
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }

// void deleteItemByID(String itemID) {
//   final voucher = (state as VoucherReady).voucher;
//   for (int i = 0; i < voucher.InventoryItems!.length; i++) {
//     print('I value : $i');
//
//     if (voucher.InventoryItems![i].BaseItem.itemID == itemID) {
//       print('I value : ${voucher.InventoryItems![i].BaseItem.itemName}');
//       // voucher.InventoryItems[i].BaseItem.quantity--;
//       // voucher.InventoryItems[i].BaseItem.currentQty--;
//       // voucher.InventoryItems[i].BaseItem.crQty--;
//       // if (voucher.InventoryItems[i].BaseItem.quantity == 0)
//       voucher.InventoryItems!.removeAt(i);
//       break;
//     }
//   }
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
//   print('Item count reduced');
//
//   return;
// }

// void updateItem({required InventoryItemDataModel item, required int row}) {
//   final voucher = (state as VoucherReady).voucher;
//   emit(VoucherRefreshing());
//   // if (voucher.InventoryItems.length > row) return;
//   CompoundItemDataModel comp = CompoundItemDataModel(BaseItem: item);
//   voucher.InventoryItems![row] = comp;
//   voucher.calculateVoucherSales();
//
//   emit(VoucherReady(voucher: voucher));
// }

// void updateledger({required LedgerMasterDataModel ledger, required int row}) {
//   final voucher = (state as VoucherReady).voucher;
//
//   voucher.ledgersList![row] = ledger;
//   voucher.calculateVoucherSales();
//   emit(VoucherReady(voucher: voucher));
// }

//void getVoucherFromRepo(String voucherNo, String voucherPrefix) async {
// emit(VoucherFetching());
// try {
// final GeneralVoucherDataModel voucher = await web!.getVoucher(
//   voucherID: voucherNo,
//   voucherPrefix: voucherPrefix,
//   link: getVoucherLink,
//   voucherTpe: voucherType,
// );
//   voucher.calculateVoucherSales();
//   print('TO GDOWN : ${voucher.toGodownID}');
//   emit(VoucherReady(voucher: voucher));
// }
// catch (e) {
//  print('123');
// print("fetching Errbloc : ${e.toString()}");
//  getEmptyVoucher();
// }
//}

// void importVoucher(GeneralVoucherDataModel voucherNew) {
//   final voucher = (state as VoucherReady).voucher;
// }
//
// void setDate(DateTime vDate) {
//   final voucher = (state as VoucherReady).voucher;
//   voucher.voucherDate = vDate;
//   emit(VoucherReady(voucher: voucher));
// }
//
// void setVoucher(final GeneralVoucherDataModel voucher) {
//   emit(VoucherReady(voucher: voucher));
// }
//
// void setToGodwnID(String godownID) {
//   final voucher = (state as VoucherReady).voucher;
//   voucher.toGodownID = godownID;
//   emit(VoucherReady(voucher: voucher));
// }
//
// void setFromGodownID(String godownID) {
//   final voucher = (state as VoucherReady).voucher;
//   voucher.fromGodownID = godownID;
//   emit(VoucherReady(voucher: voucher));
// }
//
// void calculate() {
//   var voucher = (state as VoucherReady).voucher;
//   emit(VoucherFetching());
//   voucher.calculateVoucherSales();
//   Timer(Duration(milliseconds: 100), () {
//     emit(VoucherReady(voucher: voucher));
//   });
//   // emit(VoucherReady(voucher: voucher));
// }
}

