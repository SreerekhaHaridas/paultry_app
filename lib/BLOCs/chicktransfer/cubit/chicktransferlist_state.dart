part of 'chicktransferlist_cubit.dart';

@immutable
abstract class ChicktransferlistState {}

class ChicktransferlistInitial extends ChicktransferlistState {}
class Fetching extends ChicktransferlistState {}

class FetchCompleted extends ChicktransferlistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends ChicktransferlistState {
  final String msg;

  FetchError(this.msg);
}
