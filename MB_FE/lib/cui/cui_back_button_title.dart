import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';

class CUIBackBtnTitle extends StatelessWidget {
  const CUIBackBtnTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 22,
                color: Palette.black,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Palette.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
