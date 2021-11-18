part of 'pickuplist_cubit.dart';

@immutable
abstract class PickuplistState {}

class PickuplistInitial extends PickuplistState {}
class Fetching extends PickuplistState {}

class FetchCompleted extends PickuplistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends PickuplistState {
  final String msg;

  FetchError(this.msg);
}
