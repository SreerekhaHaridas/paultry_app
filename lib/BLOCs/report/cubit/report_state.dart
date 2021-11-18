part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}
class reportFetching extends ReportState {}

class reportFetched extends ReportState {
  final List data;
  reportFetched({required this.data});
}

class reportError extends ReportState {
  final String msg;

  reportError(this.msg);
}