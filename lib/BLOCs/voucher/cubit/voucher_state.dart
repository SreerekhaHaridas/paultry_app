part of 'voucher_cubit.dart';

@immutable
abstract class VoucherState {}

class VoucherInitial extends VoucherState {}
class VoucherReady extends VoucherState {
  final GeneralVoucherDataModel voucher;
  VoucherReady({required this.voucher});
}

class VoucherRefreshing extends VoucherState {}

class VoucherSaving extends VoucherState {}

class VoucherFetching extends VoucherState {}

class VoucherSaved extends VoucherState {}

class VoucherSaveError extends VoucherState {
  final String error;

  VoucherSaveError({required this.error});
}
