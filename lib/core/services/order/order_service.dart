import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart' as ably;

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

  Future<ably.Message> subscribeToChannel() async {
    var completer = Completer<ably.Message>();
    if (realtime != null) {
      _channel = realtime?.channels.get('ORDERS');
      _channel?.subscribe().listen((event) {
        completer.complete(event);
      });
    }
    return completer.future;
  }

}