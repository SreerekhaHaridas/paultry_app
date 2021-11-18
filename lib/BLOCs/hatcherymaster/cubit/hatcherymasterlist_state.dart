part of 'hatcherymasterlist_cubit.dart';

@immutable
abstract class HatcherymasterlistState {}

class HatcherymasterlistInitial extends HatcherymasterlistState {}
class Fetching extends HatcherymasterlistState {}

class FetchCompleted extends HatcherymasterlistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends HatcherymasterlistState {
  final String msg;

  FetchError(this.msg);
}
