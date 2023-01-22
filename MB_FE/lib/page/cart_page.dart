import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/item.dart';
import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/cui/cui_back_button_title.dart';
import 'package:fe_lec_finalproject/cui/cui_cart_list_view.dart';
import 'package:fe_lec_finalproject/cui/cui_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/user.dart';

class CartPage extends StatefulWidget {
  CartPage(
      {super.key,
      required this.user,
      required this.orderList,
      required this.listener});
  final User user;
  List<OrderDetails> orderList = [];
  final ValueChanged<List<OrderDetails>> listener;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  List<OrderDetails> orderList = [];

  removeItem(OrderDetails? toBeRemoved) {
    if (toBeRemoved != null) {
      setState(() {
        orderList.remove(toBeRemoved);
      });
    }
    if (orderList.isEmpty) {
      Navigator.pop(context);
    }
  }

  updateQty(OrderDetails toBeUpdated) {
    for (OrderDetails i in orderList) {
      if (i.item == toBeUpdated.item) {
        i.quantity = toBeUpdated.quantity;
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orderList = widget.orderList;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: (_scrollControllerOffset / 50).clamp(0, 3).toDouble(),
        backgroundColor: Palette.white,
        title: CUIBackBtnTitle(
          title: "Cart",
          user: widget.user,
          parsePop: widget.listener,
          parseData: orderList,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView(
              shrinkWrap: true,
              children: orderList
                  .map((e) => CUICartListView(
                        order: e,
                        qtyController: updateQty,
                        removeController: removeItem,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
