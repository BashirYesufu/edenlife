import 'package:ably_flutter/ably_flutter.dart' as ably;

abstract class OrderRepository {

  Future<ably.Message> subscribeToChannel();

}