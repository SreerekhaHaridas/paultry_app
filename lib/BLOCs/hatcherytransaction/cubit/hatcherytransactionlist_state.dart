part of 'hatcherytransactionlist_cubit.dart';

@immutable
abstract class HatcherytransactionlistState {}

class HatcherytransactionlistInitial extends HatcherytransactionlistState {}
class Fetching extends HatcherytransactionlistState {}

class FetchCompleted extends HatcherytransactionlistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends HatcherytransactionlistState {
  final String msg;

  FetchError(this.msg);
}
