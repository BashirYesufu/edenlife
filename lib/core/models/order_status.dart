class OrderStatus {
  num? orderStage;
  String? orderId;
  String? orderStatus;

  OrderStatus({
    this.orderStage,
    this.orderId,
    this.orderStatus,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    orderStage: json["orderStage"],
    orderId: json["orderId"],
    orderStatus: json["orderStatus"],
  );

  Map<String, dynamic> toJson() => {
    "orderStage": orderStage,
    "orderId": orderId,
    "orderStatus": orderStatus,
  };

}