import 'dart:async';
import 'dart:convert';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:eden/core/models/order_status.dart';

class OrderService  {
  
  static OrderService shared = OrderService();
  ably.ClientOptions? clientOptions;
  ably.Realtime? realtime;
  ably.RealtimeChannel? _channel;

  OrderService() {
    clientOptions = ably.ClientOptions(
      key: 'i61Ayg.65UxFg:U6hc8IrfaJSlF5clpvURKs2p4ycuUS3GwAZTCuNio34',
      clientId: 'getting-started',
    );
    realtime = ably.Realtime(options: clientOptions);
  }

  Future<OrderStatus> subscribeToChannel() async {
    var completer = Completer<OrderStatus>();
    if (realtime != null) {
      _channel = realtime?.channels.get('ORDERS');
      _channel?.subscribe().listen((event) {
        Map<String, dynamic> response = jsonDecode(event.data.toString());
        OrderStatus orderStatus = OrderStatus.fromJson(response);
        completer.complete(orderStatus);
      });
    }
    return completer.future;
  }

}