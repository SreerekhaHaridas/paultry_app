part of 'branch_cubit.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class Fetching extends BranchState {}

class FetchCompleted extends BranchState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends BranchState {
  final String msg;
  FetchError(this.msg);
}
