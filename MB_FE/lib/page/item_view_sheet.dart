import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/cui/cui_form_field.dart';
import 'package:fe_lec_finalproject/cui/cui_item_list_view.dart';
import 'package:fe_lec_finalproject/cui/cui_qty_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/item.dart';

class ItemViewSheet extends StatefulWidget {
  const ItemViewSheet({super.key, required this.item});
  final Item item;

  @override
  State<ItemViewSheet> createState() => _ItemViewSheetState();
}

class _ItemViewSheetState extends State<ItemViewSheet> {
  double keyboardPadding() {
    double padding = MediaQuery.of(context).viewInsets.bottom - 40;
    return padding < 0 ? 0 : padding;
  }

  TextEditingController noteCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: keyboardPadding()),
      child: Container(
        width: SizeConfig.width,
        height: SizeConfig.heightByPercent(32),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CUIItemListView(item: widget.item),
            CUIFormField(
              controller: noteCtrl,
              hintText: "Notes (ex: extra spicy, no onions, etc)",
              keyboardType: TextInputType.text,
              top: 0,
              suffixIcon: Icons.abc,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CUIQtyButton(
                    controller: qtyCtrl,
                  ),
                  SizedBox(
                    height: 25,
                    width: 80,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                          OrderDetails(
                            item: widget.item,
                            quantity: int.parse(qtyCtrl.text),
                            price: (double.parse(qtyCtrl.text) *
                                widget.item.price),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(0)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Palette.accent),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Add item",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Palette.white),
                      ),
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
