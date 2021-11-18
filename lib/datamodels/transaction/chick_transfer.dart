import 'dart:convert';

class ChickTransferDataModel {
  DateTime? Date;
  String? FarmId;
  String? FarmName;
  int? NumberOfChickens;
  String? BatchId; //generate

  ChickTransferDataModel({
    required this.Date,
    required this.FarmId,
    required this.FarmName,
    required this.NumberOfChickens,
    required this.BatchId,
  });
  ChickTransferDataModel.empty();
  ChickTransferDataModel copyWith({
    DateTime? Date,
    String? FarmId,
    String? FarmName,
    int? NumberOfChickens,
    String? BatchId,
  }) {
    return ChickTransferDataModel(
      Date: Date ?? this.Date,
      FarmId: FarmId ?? this.FarmId,
      FarmName: FarmName ?? this.FarmName,
      NumberOfChickens: NumberOfChickens ?? this.NumberOfChickens,
      BatchId: BatchId ?? this.BatchId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Date': Date.toString(),
      'FarmId': FarmId,
      'FarmName': FarmName,
      'NumberOfChickens': NumberOfChickens,
      'BatchId': BatchId,
    };
  }

  factory ChickTransferDataModel.fromMap(Map<String, dynamic> map) {
    return ChickTransferDataModel(
      Date: map['Date'],
      FarmId: map['FarmId'],
      FarmName: map['FarmName'],
      NumberOfChickens: map['NumberOfChickens'],
      BatchId: map['BatchId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChickTransferDataModel.fromJson(String source) =>
      ChickTransferDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChickTransferDataModel('
        'Date: $Date, '
        'FarmId: $FarmId, '
        'FarmName: $FarmName,'
        'NumberOfChickens: $NumberOfChickens,'
        'BatchId: $BatchId,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChickTransferDataModel &&
        other.Date == Date &&
        other.FarmId == FarmId &&
        other.FarmName == FarmName &&
        other.NumberOfChickens == NumberOfChickens &&
        other.BatchId == BatchId;
  }

  @override
  int get hashCode {
    return Date.hashCode ^
    FarmId.hashCode ^
    FarmName.hashCode ^
    NumberOfChickens.hashCode ^
    BatchId.hashCode;
  }
}
