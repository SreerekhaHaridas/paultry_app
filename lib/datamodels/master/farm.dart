import 'dart:convert';

class FarmDataModel {
  String? FarmName;
  String? location;
  int? capacity;
  String? attenderLedger;
  String? currentBatchId;
  DateTime? currentDate;
  DateTime? pastPickupDate;
  FarmDataModel.empty();
  FarmDataModel(
      {required this.FarmName,
        required this.location,
        required this.capacity,
        required this.attenderLedger,
        required this.currentBatchId,
        required this.currentDate,
        required this.pastPickupDate});
  FarmDataModel copyWith({
    String? FarmName,
    String? location,
    int? capacity,
    String? attenderLedger,
    String? currentBatchId,
    DateTime? currentDate,
    DateTime? pastPickupDate,
  }) {
    return FarmDataModel(
      FarmName: FarmName ?? this.FarmName,
      location: location ?? this.location,
      capacity: capacity ?? this.capacity,
      attenderLedger: attenderLedger ?? this.attenderLedger,
      currentBatchId: currentBatchId ?? this.currentBatchId,
      currentDate: currentDate ?? this.currentDate,
      pastPickupDate: pastPickupDate ?? this.pastPickupDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FarmName': FarmName,
      'loction': location,
      'capacity': capacity,
      'attenderLedger': attenderLedger,
      'currentBatchId': currentBatchId,
      'currentDate': currentDate.toString(),
      'pastPickupDate': pastPickupDate.toString(),
    };
  }

  factory FarmDataModel.fromMap(Map<String, dynamic> map) {
    return FarmDataModel(
      FarmName: map['FarmName'],
      location: map['location'],
      capacity: map['capacity'],
      attenderLedger: map['attenderLedger'],
      currentBatchId: map['currentBatchId'],
      currentDate: map['currentDate'],
      pastPickupDate: map['pastPickupDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FarmDataModel.fromJson(String source) =>
      FarmDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FarmDataModel('
        'FarmName: $FarmName, '
        'loction: $location,'
        'capacity: $capacity, '
        'attenderLedger: $attenderLedger,'
        'currentBatchId: $currentBatchId,'
        'currentDate: $currentDate,'
        'pastPickupDate: $pastPickupDate,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FarmDataModel &&
        other.FarmName == FarmName &&
        other.location == location &&
        other.capacity == capacity &&
        other.attenderLedger == attenderLedger &&
        other.currentBatchId == currentBatchId &&
        other.currentDate == currentDate &&
        other.pastPickupDate == pastPickupDate;
  }

  @override
  int get hashCode {
    return FarmName.hashCode ^
    location.hashCode ^
    capacity.hashCode ^
    attenderLedger.hashCode ^
    currentBatchId.hashCode ^
    currentDate.hashCode ^
    pastPickupDate.hashCode;
  }
}
