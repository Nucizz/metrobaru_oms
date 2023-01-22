import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/cui/cui_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/item.dart';
import '../cui/cui_back_button_title.dart';
import '../debug_item_list.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  List<Item> cart = [];
  double totalPrice = 0.0;

  updateCart() {
    print("updated");
    setState(() {
      totalPrice = 0;
      for (Item i in cart) {
        totalPrice += i.price;
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: (_scrollControllerOffset / 50).clamp(0, 3).toDouble(),
        backgroundColor: Palette.white,
        title: const CUIBackBtnTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                "Foods",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Palette.black,
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: ((SizeConfig.widthByPercent(50) - 25) /
                    (SizeConfig.widthByPercent(50) + 20)),
                children: Debug.itemList
                    .map((e) => CUIItemGridView(item: e))
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Beverages",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Palette.black,
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: ((SizeConfig.widthByPercent(50) - 25) /
                    (SizeConfig.widthByPercent(50) + 20)),
                children: Debug.itemList
                    .map((e) => CUIItemGridView(item: e))
                    .toList(),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.widthByPercent(20), 0,
            SizeConfig.widthByPercent(20), 25),
        child: Visibility(
          visible: !(cart.isNotEmpty),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 43,
            width: SizeConfig.widthByPercent(60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 150, 25, 25),
                  Color.fromARGB(255, 50, 0, 0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  " Rp$totalPrice",
                  style: const TextStyle(
                    color: Palette.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_circle_right_rounded,
                  size: 30,
                  color: Palette.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
