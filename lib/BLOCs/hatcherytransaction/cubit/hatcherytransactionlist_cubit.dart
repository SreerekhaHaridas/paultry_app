import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'hatcherytransactionlist_state.dart';

class HatcherytransactionlistCubit extends Cubit<HatcherytransactionlistState> {
  HatcherytransactionlistCubit({required this.url}) : super(HatcherytransactionlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate, DateTime toDate) async {
    emit(Fetching());
    try {
      final List data = await web.getTransactionHatcheryList(
          fromDate: fromDate, toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}

