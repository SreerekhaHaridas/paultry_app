part of 'pickupeditor_cubit.dart';

@immutable
abstract class PickupeditorState {}

class PickupeditorInitial extends PickupeditorState {}
class Fetching extends PickupeditorState {}

class DataReady extends PickupeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends PickupeditorState {
  final String msg;

  FetchError(this.msg);
}
