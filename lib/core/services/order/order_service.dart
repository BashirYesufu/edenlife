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

  void subscribeToChannel() async {
    if (realtime != null) {
      _channel = realtime?.channels.get('getting-started');
      _channel?.subscribe().listen((event) {
        _handleIncomingMessage(event);
      });
    }
  }

  void _handleIncomingMessage(ably.Message message) {
    final channel = realtime?.channels.get('quickstart');
    channel?.subscribe().listen((message) {
      print('Received a greeting message in realtime: ${message.data}');
    });
  }
}