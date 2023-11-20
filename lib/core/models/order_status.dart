class OrderStatus {
  String? orderId;
  String? orderStatus;

  OrderStatus({
    this.orderId,
    this.orderStatus,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    orderId: json["orderId"],
    orderStatus: json["orderStatus"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderStatus": orderStatus,
  };
}