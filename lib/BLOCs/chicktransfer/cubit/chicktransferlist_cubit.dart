import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'chicktransferlist_state.dart';

class ChicktransferlistCubit extends Cubit<ChicktransferlistState> {
  ChicktransferlistCubit({required this.url}) : super(ChicktransferlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate, DateTime toDate) async {
    emit(Fetching());
    try {
      final List data =
      await web.getChickTransfer(fromDate: fromDate, toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}


