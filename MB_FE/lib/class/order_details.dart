import 'item.dart';

class OrderDetails {
  final Item item;
  late int quantity;
  double price;
  String? notes;

  OrderDetails({
    required this.item,
    required this.quantity,
    required this.price,
    this.notes,
  });
}
