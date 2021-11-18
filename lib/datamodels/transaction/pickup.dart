import 'dart:convert';

class PickUpDataModel {
  DateTime? date;
  String? BatchId;
  String? FarmId;
  num? Weight;
  num? BalanceFeed;
  num? BalanceMedicine;
  num? ExpectedWeight;

  PickUpDataModel(
      {required this.date,
        required this.BatchId,
        required this.FarmId,
        required this.Weight,
        required this.BalanceFeed,
        required this.BalanceMedicine,
        required this.ExpectedWeight});

  PickUpDataModel.empty();

  PickUpDataModel copyWith({
    DateTime? date,
    String? BatchId,
    String? FarmId,
    num? Weight,
    num? BalanceFeed,
    num? BalanceMedicine,
    num? ExpectedWeight,
  }) {
    return PickUpDataModel(
      date: date ?? this.date,
      BatchId: BatchId ?? this.BatchId,
      FarmId: FarmId ?? this.FarmId,
      Weight: Weight ?? this.Weight,
      BalanceFeed: BalanceFeed ?? this.BalanceFeed,
      BalanceMedicine: BalanceMedicine ?? this.BalanceMedicine,
      ExpectedWeight: ExpectedWeight ?? this.ExpectedWeight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toString(),
      'BatchId': BatchId,
      'FarmId': FarmId,
      'Weight': Weight,
      'BalanceFeed': BalanceFeed,
      'BalanceMedicine': BalanceMedicine,
      'ExpectedWeight': ExpectedWeight,
    };
  }

  factory PickUpDataModel.fromMap(Map<String, dynamic> map) {
    return PickUpDataModel(
      date: map['date'],
      BatchId: map['BatchId'],
      FarmId: map['FarmId'],
      Weight: map['Weight'],
      BalanceFeed: map['BalanceFeed'],
      BalanceMedicine: map['BalanceMedicine'],
      ExpectedWeight: map['ExpectedWeight'],
    );
  }

  String toJson() => json.encode(toMap());
  factory PickUpDataModel.fromJson(String source) =>
      PickUpDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PickUpDataModel('
        'date: $date, '
        'BatchId: $BatchId, '
        'FarmId: $FarmId,'
        'Weight: $Weight,'
        'BalanceFeed: $BalanceFeed,'
        'BalanceMedicine: $BalanceMedicine,'
        'ExpectedWeight: $ExpectedWeight,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickUpDataModel &&
        other.date == date &&
        other.BatchId == BatchId &&
        other.FarmId == FarmId &&
        other.Weight == Weight &&
        other.BalanceFeed == BalanceFeed &&
        other.BalanceMedicine == BalanceMedicine &&
        other.ExpectedWeight == ExpectedWeight;
  }

  @override
  int get hashCode {
    return date.hashCode ^
    BatchId.hashCode ^
    FarmId.hashCode ^
    Weight.hashCode ^
    BalanceFeed.hashCode ^
    BalanceMedicine.hashCode ^
    ExpectedWeight.hashCode;
  }
}
