import 'package:eden/core/services/order/order_repository.dart';
import '../../models/order_status.dart';
import 'order_service.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderService _service = OrderService();

  @override
  Future<OrderStatus> subscribeToChannel() {
    return _service.subscribeToChannel();
  }

}