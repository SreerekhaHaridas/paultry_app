part of 'chicktransfereditor_cubit.dart';

@immutable
abstract class ChicktransfereditorState {}

class ChicktransfereditorInitial extends ChicktransfereditorState {}
class Fetching extends ChicktransfereditorState {}

class DataReady extends ChicktransfereditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends ChicktransfereditorState {
  final String msg;

  FetchError(this.msg);
}
