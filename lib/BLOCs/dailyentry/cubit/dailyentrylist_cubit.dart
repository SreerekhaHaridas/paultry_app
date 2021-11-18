import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'dailyentrylist_state.dart';

class DailyentrylistCubit extends Cubit<DailyentrylistState> {
  DailyentrylistCubit({required this.url}) : super(DailyentrylistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate, DateTime toDate) async {
    emit(Fetching());
    try {
      final List data =
      await web.getDailyEntryList(fromDate: fromDate, toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}

