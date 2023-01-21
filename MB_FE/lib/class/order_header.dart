import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/user.dart';

class OrderHeader {
  final int id; // ID untuk seluruh transaksi pada seluruh waktu
  final int index; // Index transaksi pada hari itu dimulai dari 0 setiap harinya
  final List<OrderDetails> items;
  final String dateTime;
  final double totalPrice;
  final int typeId;
  final String typeName;
  final int statusId;
  final String statusName;

  // For dine in
  int? tableNumber;

  // For delivery or pickup only
  User? customer;
  String? address; // only delivery

  OrderHeader({
    required this.id,
    required this.index,
    required this.items,
    required this.dateTime,
    required this.totalPrice,
    required this.typeId,
    required this.typeName,
    required this.statusId,
    required this.statusName,
    this.tableNumber,
    this.customer,
    this.address,
  });

  static bool isDineIn(int typeId) {
    if (typeId == 1) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDelivery(int typeId) {
    if (typeId == 2) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPickUp(int typeId) {
    if (typeId == 3) {
      return true;
    } else {
      return false;
    }
  }
}
