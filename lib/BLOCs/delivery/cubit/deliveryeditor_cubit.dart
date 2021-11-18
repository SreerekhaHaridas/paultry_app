import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'deliveryeditor_state.dart';

class DeliveryeditorCubit extends Cubit<DeliveryeditorState> {
  DeliveryeditorCubit({required this.url}) : super(DeliveryeditorInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List<Map> data = await web.getDeliveryEditor();
      emit(DataReady(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}


