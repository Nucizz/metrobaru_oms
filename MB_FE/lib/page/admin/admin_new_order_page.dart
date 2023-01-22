import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/cui/cui_back_button_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ADMNewOrderPage extends StatefulWidget {
  const ADMNewOrderPage({super.key});

  @override
  State<ADMNewOrderPage> createState() => _ADMNewOrderPageState();
}

class _ADMNewOrderPageState extends State<ADMNewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(),
      ),
    );
  }
}
