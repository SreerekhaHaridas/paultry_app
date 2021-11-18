// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:paultry_app/datamodels/master/farm.dart';
import 'package:paultry_app/datamodels/master/hatchery.dart';
import 'package:paultry_app/datamodels/transaction/chick_transfer.dart';
import 'package:paultry_app/datamodels/transaction/daily_entry_from.dart';
import 'package:paultry_app/datamodels/transaction/delivery.dart';
import 'package:paultry_app/datamodels/transaction/hatchery.dart';
import 'package:paultry_app/datamodels/transaction/pickup.dart';
class WebserviceHelper {
  Dio dio = Dio(BaseOptions(
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": true,
      "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
  ));

//to put data to json/save to cloud

  Future<bool> saveRecord({required DailyEntryFormDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertDailyEntryTransfer";
    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }


  Future<bool> chickRecord({required ChickTransferDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertChickenTransfer";
    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }


  Future<bool> deliveryRecord({required DeliveryDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertDeliveryTransfer";
    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }


  Future<bool> farmRecord({required FarmDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertFarmMaster";

    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }

  Future<bool> mHatcheryRecord({required HatcheryDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertHatcheryMaster";
    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }


  Future<bool> tHatcheryRecord(
      {required TransactionHatecheryDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertHatcheryTransfer";

    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }


  Future<bool> pickupRecord({required PickUpDataModel model}) async {
    model.toJson();
    String url = "http://31.220.109.198:8050/InsertPickUpTransfer";
    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }
    return true;
  }
//to get data from json

  Future<DailyEntryFormDataModel> getRecord({String? id}) async {
    String url = "";
    dynamic data = await dio.get(url);
    DailyEntryFormDataModel model = DailyEntryFormDataModel.fromJson(data);
    return model;
  }

//to get whole list of values

  Future<List> getList() async {
    List dvals = [];
    String url = "http://31.220.109.198:8050/GetFarmMasterData";
    try {
      Response response = await dio.get(url);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getFarmEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }



  Future<List> getPickUpList(
      {required DateTime fromDate, required DateTime toDate}) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fromDateStr = formatter.format(fromDate);
    String toDateStr = formatter.format(toDate);
    List dvals = [];
    var body = {'fromdate': fromDateStr, 'todate': toDateStr};
    String url = "http://31.220.109.198:8050/GetPickupTransferListByDate";
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getPickupEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }




  Future<List> getChickTransfer(
      {required DateTime fromDate, required DateTime toDate}) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fromDateStr = formatter.format(fromDate);
    print('fromDate : $fromDateStr');
    String toDateStr = formatter.format(toDate);
    print('todate : $toDateStr');
    List dvals = [];
    var body = {'fromDate': fromDateStr, 'toDate': toDateStr};
    String url = "http://31.220.109.198:8050/GetChickenTransferListByDate";
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getChickEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }




  Future<List> getMasterHatcheryList() async {
    List dvals = [];
    String url = "http://31.220.109.198:8050/GetHatcheryMasterData";
    try {
      Response response = await dio.get(url);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getMasterHatcheryEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }



  Future<List> getTransactionHatcheryList(
      {required DateTime fromDate, required DateTime toDate}) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fromDateStr = formatter.format(fromDate);
    String toDateStr = formatter.format(toDate);
    List dvals = [];
    var body = {'fromdate': fromDateStr, 'todate': toDateStr};
    String url = "http://31.220.109.198:8050/GetHatcheryTransferListByDate";
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getTransactionHatcheryEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }





  Future<List> getDeliveryList(
      {required DateTime fromDate, required DateTime toDate}) async {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String fromDateStr = formatter.format(fromDate);
    String toDateStr = formatter.format(toDate);
    List dvals = [];
    var body = {'fromdate': fromDateStr, 'todate': toDateStr};
    String url = "http://31.220.109.198:8050/GetDeliveryTransferData";
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getDeliveryEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }






  Future<List> getDailyEntryList(
      {required DateTime fromDate, required DateTime toDate}) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fromDateStr = formatter.format(fromDate);
    String toDateStr = formatter.format(toDate);

    List dvals = [
      // {
      //   'farmId': 'FID1',
      // },
      // {'farmId': 'FID2'}
    ];
    var body = {'fromdate': fromDateStr, 'todate': toDateStr};
    String url = "http://31.220.109.198:8050/GetDailyentryTransferListByDate";
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      dynamic tdata = json.decode(response.data);
      dvals = tdata['hits'];
      print(tdata['hits']);
    } catch (e) {
      print('Exception');
      print(e.toString());
    }
    return dvals;
  }

  Future<List<Map>> getDailyEntryEditor() async {
    String url = "";
    dynamic data = await dio.get(url);
    return data;
  }


  Future<List> getReport() async {
    List dvals = [
      // {
      //    'NumberOfChicken' :46,
      //  }
    ];
    String url = "31.220.109.198:8050/reports";
    print(url);
    Response response;
    try {
      response = await dio.post(url);
      // print(url);
      print(response.data);
      // data = response.data['data'];
      return response.data['data'];
    } catch (e) {
      print(e.toString());
      return dvals;
    }
  }
}

