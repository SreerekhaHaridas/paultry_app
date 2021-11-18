// ignore_for_file: file_names

import 'dart:convert';

import 'package:hive/hive.dart';

part 'FarmModel.g.dart';

@HiveType(typeId: 0)
class FarmDataModel {
  @HiveField(0)
  String farmname;
  @HiveField(1)
  String location;
  @HiveField(2)
  int capacity;
  @HiveField(3)
  String attenderLedger;
  @HiveField(4)
  String currentBatchId;
  @HiveField(5)
  DateTime currentDate;
  @HiveField(6)
  DateTime pastPickupDate;

  FarmDataModel(
      this.farmname,
      this.capacity,
      this.location,
      this.attenderLedger,
      this.currentBatchId,
      this.currentDate,
      this.pastPickupDate,
      );

}
