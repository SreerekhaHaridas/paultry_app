part of 'hatcherytransactioneditor_cubit.dart';

@immutable
abstract class HatcherytransactioneditorState {}

class HatcherytransactioneditorInitial extends HatcherytransactioneditorState {}
class Fetching extends HatcherytransactioneditorState {}

class DataReady extends HatcherytransactioneditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends HatcherytransactioneditorState {
  final String msg;

  FetchError(this.msg);
}