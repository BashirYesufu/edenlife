import 'package:eden/features/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import '../constants/eden_colors.dart';
import '../core/models/order_timeline.dart';

class OrderTimelineScreen extends StatefulWidget {
  const OrderTimelineScreen({super.key});
  static final routeName = "/order-timeline";

  @override
  State<OrderTimelineScreen> createState() => _OrderTimelineScreenState();
}

class _OrderTimelineScreenState extends State<OrderTimelineScreen> {
  final OrderViewModel _orderViewModel = OrderViewModel();

  List<OrderTimeline> timeline = [
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

  @override
  void initState() {
    _orderViewModel.subscribe();

    _orderViewModel.ablyMessageObservable.listen((event) {
      // _refreshOrder(message);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Timeline'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(
            timeline.length,
            (index) => Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: EdenColors.cardColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundColor: Colors.green, radius: 5,),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(timeline[index].orderStatus, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          Text(timeline[index].statusDescription, style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
