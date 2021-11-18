part of 'farmeditor_cubit.dart';

@immutable
abstract class FarmeditorState {}

class FarmeditorInitial extends FarmeditorState {}
class Fetching extends FarmeditorState {}

class DataReady extends FarmeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends FarmeditorState {
  final String msg;

  FetchError(this.msg);
}
