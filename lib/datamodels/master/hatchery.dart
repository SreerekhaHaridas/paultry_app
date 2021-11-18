import 'dart:convert';

class HatcheryDataModel {
  String? name;
  int? capacity;
  String? location;
  String? attenderLedger;
  String? currentBatchId;
  DateTime? currentDate;
  DateTime? pastPickupDate;

  HatcheryDataModel(
      {required this.name,
        required this.capacity,
        required this.location,
        required this.attenderLedger,
        required this.currentBatchId,
        required this.currentDate,
        required this.pastPickupDate});
  HatcheryDataModel.empty();
  HatcheryDataModel copyWith({
    String? name,
    int? capacity,
    String? location,
    String? attenderLedger,
    String? currentBatchId,
    DateTime? currentDate,
    DateTime? pastPickupDate,
  }) {
    return HatcheryDataModel(
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      location: location ?? this.location,
      attenderLedger: attenderLedger ?? this.attenderLedger,
      currentBatchId: currentBatchId ?? this.currentBatchId,
      currentDate: currentDate ?? this.currentDate,
      pastPickupDate: pastPickupDate ?? this.pastPickupDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'capacity': capacity,
      'loction': location,
      'attenderLedger': attenderLedger,
      'currentBatchId': currentBatchId,
      'currentDate': currentDate.toString(),
      'pastPickupDate': pastPickupDate.toString(),
    };
  }

  factory HatcheryDataModel.fromMap(Map<String, dynamic> map) {
    return HatcheryDataModel(
      name: map['name'],
      capacity: map['capacity'],
      location: map['location'],
      attenderLedger: map['attenderLedger'],
      currentBatchId: map['currentBatchId'],
      currentDate: map['currentDate'],
      pastPickupDate: map['pastPickupDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HatcheryDataModel.fromJson(String source) =>
      HatcheryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HatcheryDataModel('
        'name: $name, '
        'capacity: $capacity, '
        'loction: $location,'
        'attenderLedger: $attenderLedger,'
        'currentBatchId: $currentBatchId,'
        'currentDate: $currentDate,'
        'pastPickupDate: $pastPickupDate,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HatcheryDataModel &&
        other.name == name &&
        other.capacity == capacity &&
        other.location == location &&
        other.attenderLedger == attenderLedger &&
        other.currentBatchId == currentBatchId &&
        other.currentDate == currentDate &&
        other.pastPickupDate == pastPickupDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    capacity.hashCode ^
    location.hashCode ^
    attenderLedger.hashCode ^
    currentBatchId.hashCode ^
    currentDate.hashCode ^
    pastPickupDate.hashCode;
  }
}
