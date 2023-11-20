
class OrderTimeline {
  String orderStatus;
  String statusDescription;
  DateTime time;

  OrderTimeline({
    required this.orderStatus,
    required this.statusDescription,
    required this.time,
  });

  static List<OrderTimeline> timeline = [
    OrderTimeline(
        orderStatus: 'Order placed',
        statusDescription: 'Waiting for the vendor to accept your order',
        time: DateTime.now()
    ),
    OrderTimeline(
        orderStatus: 'Order accepted',
        statusDescription: 'The vendor is preparing your order and a rider will pickup soon',
        time: DateTime.now()
    ),
    OrderTimeline(
        orderStatus: 'Order pickup in progress',
        statusDescription: 'A rider is on the way to pickup your order',
        time: DateTime.now()
    ),
    OrderTimeline(
        orderStatus: 'Order on the way',
        statusDescription: 'A rider has picked up your order and is bringing it your way',
        time: DateTime.now()
    ),
    OrderTimeline(
        orderStatus: 'Order arrived',
        statusDescription: 'Don\'t keep the rider waiting',
        time: DateTime.now()
    ),
    OrderTimeline(
        orderStatus: 'Order delivered',
        statusDescription: 'Enjoy!',
        time: DateTime.now()
    ),
  ];


}