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
      child: SizedBox(
        width: SizeConfig.width! - 15,
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: OrderHeader.isDineIn(widget.orderInfo.typeId)
                  ? Image.asset(
                      "assets/images/UI/table_${widget.orderInfo.tableNumber}.png",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    )
                  : (widget.orderInfo.customer!.profilePicturePath) != null
                      ? Image.network(
                          widget.orderInfo.customer!.profilePicturePath!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/UI/default profile picture.png",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#${widget.orderInfo.index} ${OrderHeader.isDineIn(widget.orderInfo.typeId) ? "Table ${widget.orderInfo.tableNumber}" : widget.orderInfo.customer!.username}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        (OrderHeader.isDineIn(widget.orderInfo.typeId)
                            ? Icons.local_dining_rounded
                            : OrderHeader.isDelivery(widget.orderInfo.typeId)
                                ? Icons.delivery_dining_rounded
                                : Icons.shopping_bag_rounded),
                        size: 18,
                        color: Palette.dark,
                      ),
                      Text(
                        " ${widget.orderInfo.typeName}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Palette.dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Palette.getStatusColor(widget.orderInfo.statusId),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text(
                      widget.orderInfo.statusName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Palette.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "Rp${widget.orderInfo.totalPrice}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.dark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
