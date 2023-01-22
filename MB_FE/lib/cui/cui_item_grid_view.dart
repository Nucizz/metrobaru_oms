import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/page/item_view_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/item.dart';
import '../class/order_details.dart';
import 'cui_form_field.dart';
import 'cui_item_list_view.dart';
import 'cui_qty_button.dart';

class CUIItemGridView extends StatefulWidget {
  const CUIItemGridView(
      {super.key, required this.item, required this.listener});
  final Item item;
  final ValueChanged<OrderDetails> listener;

  @override
  State<CUIItemGridView> createState() => _CUIItemGridViewState();
}

class _CUIItemGridViewState extends State<CUIItemGridView> {
  double keyboardPadding() {
    double padding = MediaQuery.of(context).viewInsets.bottom - 40;
    return padding < 0 ? 0 : padding;
  }

  TextEditingController noteCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            isScrollControlled: true,
            backgroundColor: Palette.background,
            builder: (builder) {
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
                                  widget.listener(
                                    OrderDetails(
                                      item: widget.item,
                                      quantity: int.parse(qtyCtrl.text),
                                      price: (double.parse(qtyCtrl.text) *
                                          widget.item.price),
                                      notes: noteCtrl.text,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(0)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Palette.accent),
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
            });
      },
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              widget.item.imagePath,
              width: SizeConfig.widthByPercent(50) - 25,
              height: SizeConfig.widthByPercent(50) - 25,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.item.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Palette.black,
            ),
          ),
          Text(
            "Rp${widget.item.price}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palette.dark,
            ),
          ),
        ],
      ),
    );
  }
}
