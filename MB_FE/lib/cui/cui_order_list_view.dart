import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/size_config.dart';

class CUIOrderListView extends StatefulWidget {
  const CUIOrderListView({super.key, required this.orderInfo});
  final OrderHeader orderInfo;

  @override
  State<CUIOrderListView> createState() => _CUIOrderListViewState();
}

class _CUIOrderListViewState extends State<CUIOrderListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Container(
          width: SizeConfig.width! - 15,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            color: Palette.light,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#${widget.orderInfo.id}-${widget.orderInfo.index}",
                    style: const TextStyle(
                      color: Palette.dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  OrderHeader.duration(widget.orderInfo.lastUpdatedTS),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      OrderHeader.isDineIn(widget.orderInfo.typeId)
                          ? Icons.local_dining
                          : OrderHeader.isDelivery(widget.orderInfo.typeId)
                              ? Icons.delivery_dining_rounded
                              : Icons.inbox_rounded,
                      size: 16,
                    ),
                  ),
                  Text(
                    OrderHeader.isDineIn(widget.orderInfo.typeId)
                        ? "Table ${widget.orderInfo.tableNumber}"
                        : widget.orderInfo.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Palette.getStatusColor(widget.orderInfo.statusId),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.orderInfo.statusName,
                      style: const TextStyle(
                        color: Palette.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "Rp${widget.orderInfo.totalPrice}",
                    style: const TextStyle(
                      color: Palette.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
