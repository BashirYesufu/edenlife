import 'package:eden/constants/eden_colors.dart';
import 'package:eden/features/order_timeline.dart';
import 'package:eden/features/view_model/order_view_model.dart';
import 'package:eden/util/eden_navigator.dart';
import 'package:eden/util/eden_util.dart';
import 'package:eden/widgets/eden_primary_button.dart';
import 'package:flutter/material.dart';
import '../constants/image_path.dart';
import '../core/models/order_status.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static final routeName = "/order";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final OrderViewModel _orderViewModel = OrderViewModel();
  OrderStatus? currentOrderStatus;

  @override
  void initState() {

    setState(() {
      currentOrderStatus = OrderStatus(orderStatus: 'ORDER PLACED');
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
        title: Text('Order Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Track Your Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: EdenColors.cardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(ImagePath.shoppingCart, height: 40, width: 60,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(EdenUtil.displayOrderTimeline(orderStatus: currentOrderStatus?.orderStatus).orderStatus, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                              Text(EdenUtil.displayOrderTimeline(orderStatus: currentOrderStatus?.orderStatus).statusDescription, style: TextStyle(fontSize: 14),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) => Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width / 9,
                              color: EdenUtil.checkOrderStatus(index: index, orderStatus: currentOrderStatus?.orderStatus) ? Colors.green : Colors.grey,
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: EdenPrimaryButton(
                            label: 'Track your order',
                            onTap: (){
                              EdenNavigator.navigateTo(context, OrderTimelineScreen.routeName, arguments: currentOrderStatus);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edible catering', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),),
                    Column(
                      children: [
                        buildOrderItem(title: 'Order ID', subtitle: '#23122'),
                        buildOrderItem(title: 'Order Date', subtitle: 'Fri, Jun 30 2023'),
                        buildOrderItem(title: 'Order Type', subtitle: 'Instant'),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: EdenColors.cardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Image.asset(ImagePath.riskyBurger, height: 80, width: 100,),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Risky Burger', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                  Text('x2', style: TextStyle(fontSize: 12),),
                                  Text('Add-ons: Plastic cutlery', style: TextStyle(fontSize: 12),),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text('₦9,000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderItem({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
