import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'hatcherymasterlist_state.dart';

class HatcherymasterlistCubit extends Cubit<HatcherymasterlistState> {
  HatcherymasterlistCubit({required this.url}) : super(HatcherymasterlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List data = await web.getMasterHatcheryList();
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
