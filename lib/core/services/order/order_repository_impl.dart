import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:eden/core/services/order/order_repository.dart';
import 'order_service.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderService _service = OrderService();

  @override
  Future<ably.Message> subscribeToChannel() {
    return _service.subscribeToChannel();
  }

}