import 'dart:convert';

class DailyEntryFormDataModel {
  DateTime? date;
  String? BatchId;
  String? farmId;
  num? FeedQuantity;
  num? MedicineQuantity;
  int? NumberDead;
  num? AverageWeight;

  DailyEntryFormDataModel(
      {required this.date,
        required this.BatchId,
        required this.farmId,
        required this.FeedQuantity,
        required this.MedicineQuantity,
        required this.NumberDead,
        required this.AverageWeight});
  DailyEntryFormDataModel.empty();
  DailyEntryFormDataModel copyWith({
    DateTime? date,
    String? BatchId,
    String? farmId,
    num? FeedQuantity,
    num? MedicineQuantity,
    int? NumberDead,
    num? AverageWeight,
  }) {
    return DailyEntryFormDataModel(
      date: date ?? this.date,
      BatchId: BatchId ?? this.BatchId,
      farmId: farmId ?? this.farmId,
      FeedQuantity: FeedQuantity ?? this.FeedQuantity,
      MedicineQuantity: MedicineQuantity ?? this.MedicineQuantity,
      NumberDead: NumberDead ?? this.NumberDead,
      AverageWeight: AverageWeight ?? this.AverageWeight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toString(),
      'BatchId': BatchId,
      'farmId': farmId,
      'FeedQuantity': FeedQuantity,
      'MedicineQuantity': MedicineQuantity,
      'NumberDead': NumberDead,
      'AverageWeight': AverageWeight,
    };
  }

  factory DailyEntryFormDataModel.fromMap(Map<String, dynamic> map) {
    return DailyEntryFormDataModel(
      date: map['date'],
      BatchId: map['BatchId'],
      farmId: map['farmId'],
      FeedQuantity: map['FeedQuantity'],
      MedicineQuantity: map['MedicineQuantity'],
      NumberDead: map['NumberDead'],
      AverageWeight: map['AverageWeight'],
    );
  }

  String toJson() => json.encode(toMap());
  factory DailyEntryFormDataModel.fromJson(String source) =>
      DailyEntryFormDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyEntryFormDataModel('
        'date: $date, '
        'BatchId: $BatchId, '
        'farmId: $farmId,'
        'FeedQuantity: $FeedQuantity,'
        'MedicineQuantity: $MedicineQuantity,'
        'NumberDead: $NumberDead,'
        'AverageWeight: $AverageWeight,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyEntryFormDataModel &&
        other.date == date &&
        other.BatchId == BatchId &&
        other.farmId == farmId &&
        other.FeedQuantity == FeedQuantity &&
        other.MedicineQuantity == MedicineQuantity &&
        other.NumberDead == NumberDead &&
        other.AverageWeight == AverageWeight;
  }

  @override
  int get hashCode {
    return date.hashCode ^
    BatchId.hashCode ^
    farmId.hashCode ^
    FeedQuantity.hashCode ^
    MedicineQuantity.hashCode ^
    NumberDead.hashCode ^
    AverageWeight.hashCode;
  }
}
