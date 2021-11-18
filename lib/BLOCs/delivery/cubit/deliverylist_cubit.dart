import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';

part 'deliverylist_state.dart';

class DeliverylistCubit extends Cubit<DeliverylistState> {
  DeliverylistCubit({required this.url}) : super(DeliverylistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate, DateTime toDate) async {
    emit(Fetching());
    try {
      final List data =
      await web.getDeliveryList(fromDate: fromDate, toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}

