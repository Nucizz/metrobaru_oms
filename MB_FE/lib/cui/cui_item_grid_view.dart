import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/item.dart';

class CUIItemGridView extends StatefulWidget {
  const CUIItemGridView({super.key, required this.item});
  final Item item;

  @override
  State<CUIItemGridView> createState() => _CUIItemGridViewState();
}

class _CUIItemGridViewState extends State<CUIItemGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
