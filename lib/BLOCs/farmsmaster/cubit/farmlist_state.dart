part of 'farmlist_cubit.dart';

@immutable
abstract class FarmlistState {}

class FarmlistInitial extends FarmlistState {}
class Fetching extends FarmlistState {}

class FetchCompleted extends FarmlistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends FarmlistState {
  final String msg;
  FetchError(this.msg);
}
