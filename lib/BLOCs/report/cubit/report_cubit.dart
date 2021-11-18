import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit({required this.url}) : super(ReportInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(reportFetching());
    try {
      final List data = await web.getReport();
      emit(reportFetched(data: data));
    } catch (e) {
      print(e.toString());
      emit(reportError(
        e.toString(),
      ));
    }
  }
}

