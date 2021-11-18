part of 'deliveryeditor_cubit.dart';

@immutable
abstract class DeliveryeditorState {}

class DeliveryeditorInitial extends DeliveryeditorState {}
class Fetching extends DeliveryeditorState {}

class DataReady extends DeliveryeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends DeliveryeditorState {
  final String msg;

  FetchError(this.msg);
}
