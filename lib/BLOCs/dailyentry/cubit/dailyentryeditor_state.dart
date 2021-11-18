part of 'dailyentryeditor_cubit.dart';

@immutable
abstract class DailyentryeditorState {}

class DailyentryeditorInitial extends DailyentryeditorState {}
class Fetching extends DailyentryeditorState {}

class DataReady extends DailyentryeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends DailyentryeditorState {
  final String msg;

  FetchError(this.msg);
}