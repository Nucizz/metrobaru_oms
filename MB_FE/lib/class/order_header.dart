import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:flutter/cupertino.dart';

import 'color_palette.dart';

class OrderHeader {
  final int id; // ID untuk seluruh transaksi pada seluruh waktu
  final int
      index; // Index transaksi pada hari itu dimulai dari 0 setiap harinya
  final List<OrderDetails> items;
  final int createdTS;
  final int lastUpdatedTS;
  final double totalPrice;
  final int typeId;
  final String typeName;
  final int statusId;
  final String statusName;

  // For dine in
  int? tableNumber;

  // For delivery or pickup only
  String? name; // For non-application based order
  User? user; // For aplication based order
  String? address; // only delivery

  OrderHeader({
    required this.id,
    required this.index,
    required this.items,
    required this.createdTS,
    required this.lastUpdatedTS,
    required this.totalPrice,
    required this.typeId,
    required this.typeName,
    required this.statusId,
    required this.statusName,
    this.tableNumber,
    this.name,
    this.user,
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

  static Widget duration(int timestamp) {
    var current = DateTime.now();
    var start = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var difference = current.difference(start).inMinutes;
    return Text(
      "$difference mins",
      style: TextStyle(
        color: (difference <= 30)
            ? Palette.dark
            : (difference <= 45)
                ? Palette.warning
                : Palette.error,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
