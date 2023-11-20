import '../../models/order_status.dart';

abstract class OrderRepository {

  Future<OrderStatus> subscribeToChannel();

}