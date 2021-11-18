import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'farmlist_state.dart';

class FarmlistCubit extends Cubit<FarmlistState> {
  FarmlistCubit({required this.url}) : super(FarmlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      print('fetching');
      final List data = await web.getList();
      print('Fetch DONE');
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}

