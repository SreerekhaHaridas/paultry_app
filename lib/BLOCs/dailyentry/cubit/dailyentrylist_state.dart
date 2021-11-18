part of 'dailyentrylist_cubit.dart';

@immutable
abstract class DailyentrylistState {}

class DailyentrylistInitial extends DailyentrylistState {}
class Fetching extends DailyentrylistState {}

class FetchCompleted extends DailyentrylistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends DailyentrylistState {
  final String msg;

  FetchError(this.msg);
}