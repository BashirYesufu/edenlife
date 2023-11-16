import 'package:flutter/material.dart';

class OrderTimelineScreen extends StatefulWidget {
  const OrderTimelineScreen({super.key});
  static final routeName = "/order-timeline";

  @override
  State<OrderTimelineScreen> createState() => _OrderTimelineScreenState();
}

class _OrderTimelineScreenState extends State<OrderTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
