import 'package:eden/core/models/order_status.dart';
import 'package:eden/features/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import '../constants/eden_colors.dart';
import '../core/models/order_timeline.dart';
import '../util/eden_util.dart';

class OrderTimelineScreen extends StatefulWidget {
  const OrderTimelineScreen({ this.orderStatus, super.key,});
  static const routeName = "/order-timeline";
  final OrderStatus? orderStatus;

  @override
  State<OrderTimelineScreen> createState() => _OrderTimelineScreenState();
}

class _OrderTimelineScreenState extends State<OrderTimelineScreen> {
  final OrderViewModel _orderViewModel = OrderViewModel();
  OrderStatus? currentOrderStatus;

  @override
  void initState() {
    setState(() {
      currentOrderStatus = widget.orderStatus;
    });

    _orderViewModel.subscribe();

    _orderViewModel.ablyMessageObservable.listen((orderStatus) {
      setState(() {
        currentOrderStatus = orderStatus;
      });
      _orderViewModel.subscribe();
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
            OrderTimeline.timeline.length,
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
                  CircleAvatar(backgroundColor: EdenUtil.checkOrderStatus(index: index, orderStatus: currentOrderStatus?.orderStatus) ? Colors.green : Colors.grey, radius: 10,),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(OrderTimeline.timeline[index].orderStatus, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          Text(OrderTimeline.timeline[index].statusDescription, style: TextStyle(fontSize: 12),),
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
