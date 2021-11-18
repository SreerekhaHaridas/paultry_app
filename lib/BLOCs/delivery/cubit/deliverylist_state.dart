part of 'deliverylist_cubit.dart';

@immutable
abstract class DeliverylistState {}

class DeliverylistInitial extends DeliverylistState {}
class Fetching extends DeliverylistState {}

class FetchCompleted extends DeliverylistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends DeliverylistState {
  final String msg;

  FetchError(this.msg);
}
