import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'hatcherymastereditor_state.dart';

class HatcherymastereditorCubit extends Cubit<HatcherymastereditorState> {
  HatcherymastereditorCubit({required this.url}) : super(HatcherymastereditorInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List<Map> data = await web.getMasterHatcheryEditor();
      emit(DataReady(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
