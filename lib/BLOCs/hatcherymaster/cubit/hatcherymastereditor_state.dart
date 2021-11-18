part of 'hatcherymastereditor_cubit.dart';

@immutable
abstract class HatcherymastereditorState {}

class HatcherymastereditorInitial extends HatcherymastereditorState {}
class Fetching extends HatcherymastereditorState {}

class DataReady extends HatcherymastereditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends HatcherymastereditorState {
  final String msg;

  FetchError(this.msg);
}
