import 'dart:convert';

class DeliveryDataModel {
  String? SalesOrderId;
  num? SalesOrderQuantity;
  num? ActualWeight;
  num? DiscountWeight;
  num? NetWeight;
  String? CustomerLedger;

  DeliveryDataModel({
    required this.SalesOrderId,
    required this.SalesOrderQuantity,
    required this.ActualWeight,
    required this.DiscountWeight,
    required this.NetWeight,
    required this.CustomerLedger,
  });
  DeliveryDataModel.empty();
  DeliveryDataModel copyWith({
    String? SalesOrderId,
    num? SalesOrderQuantity,
    num? ActualWeight,
    num? DiscountWeight,
    num? NetWeight,
    String? CustomerLedger,
  }) {
    return DeliveryDataModel(
      SalesOrderId: SalesOrderId ?? this.SalesOrderId,
      SalesOrderQuantity: SalesOrderQuantity ?? this.SalesOrderQuantity,
      ActualWeight: ActualWeight ?? this.ActualWeight,
      DiscountWeight: DiscountWeight ?? this.DiscountWeight,
      NetWeight: NetWeight ?? this.NetWeight,
      CustomerLedger: CustomerLedger ?? this.CustomerLedger,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SalesOrderId': SalesOrderId,
      'SalesOrderQuantity': SalesOrderQuantity,
      'ActualWeight': ActualWeight,
      'DiscountWeight': DiscountWeight,
      'NetWeight': NetWeight,
      'CustomerLedger': CustomerLedger,
    };
  }

  factory DeliveryDataModel.fromMap(Map<String, dynamic> map) {
    return DeliveryDataModel(
      SalesOrderId: map['SalesOrderId'],
      SalesOrderQuantity: map['SalesOrderQuantity'],
      ActualWeight: map['ActualWeight'],
      DiscountWeight: map['DiscountWeight'],
      NetWeight: map['NetWeight'],
      CustomerLedger: map['CustomerLedger'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryDataModel.fromJson(String source) =>
      DeliveryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeliveryDataModel('
        'name: $SalesOrderId, '
        'capacity: $SalesOrderQuantity, '
        'loction: $ActualWeight,'
        'attenderLedger: $DiscountWeight,'
        'currentBatchId: $NetWeight,'
        'currentDate: $CustomerLedger,'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeliveryDataModel &&
        other.SalesOrderId == SalesOrderId &&
        other.SalesOrderQuantity == SalesOrderQuantity &&
        other.ActualWeight == ActualWeight &&
        other.DiscountWeight == DiscountWeight &&
        other.NetWeight == NetWeight &&
        other.CustomerLedger == CustomerLedger;
  }

  @override
  int get hashCode {
    return SalesOrderId.hashCode ^
    SalesOrderQuantity.hashCode ^
    ActualWeight.hashCode ^
    DiscountWeight.hashCode ^
    NetWeight.hashCode ^
    CustomerLedger.hashCode;
  }
}
