import '../core/models/order_timeline.dart';

class EdenUtil {
  static bool checkOrderStatus({required int index, required String? orderStatus}) {
    switch (index) {
      case 0:
        if (orderStatus == "ORDER PLACED" ||
            orderStatus == "ORDER ACCEPTED" ||
            orderStatus == "ORDER PICK UP IN PROGRESS" ||
            orderStatus == "ORDER ON THE WAY TO CUSTOMER" ||
            orderStatus == "ORDER ARRIVED" ||
            orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      case 1:
        if (orderStatus == "ORDER ACCEPTED" ||
            orderStatus == "ORDER PICK UP IN PROGRESS" ||
            orderStatus == "ORDER ON THE WAY TO CUSTOMER" ||
            orderStatus == "ORDER ARRIVED" ||
            orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      case 2:
        if (orderStatus == "ORDER PICK UP IN PROGRESS" ||
            orderStatus == "ORDER ON THE WAY TO CUSTOMER" ||
            orderStatus == "ORDER ARRIVED" ||
            orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      case 3:
        if (orderStatus == "ORDER ON THE WAY TO CUSTOMER" ||
            orderStatus == "ORDER ARRIVED" ||
            orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      case 4:
        if (orderStatus == "ORDER ARRIVED" ||
            orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      case 5:
        if (orderStatus == "ORDER DELIVERED" ){
          return true;
        } else {
          return false;
        }
      default:
        return false;
    }
  }

  static OrderTimeline displayOrderTimeline({required String? orderStatus}) {
    switch (orderStatus) {
      case "ORDER PLACED":
        return OrderTimeline.timeline[0];
      case "ORDER ACCEPTED":
        return OrderTimeline.timeline[1];
      case "ORDER PICK UP IN PROGRESS":
        return OrderTimeline.timeline[2];
      case "ORDER ON THE WAY TO CUSTOMER":
        return OrderTimeline.timeline[3];
      case "ORDER ARRIVED":
        return OrderTimeline.timeline[4];
      case "ORDER DELIVERED":
        return OrderTimeline.timeline[5];
      default:
        return OrderTimeline.timeline[0];
    }
  }

}