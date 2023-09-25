import 'package:flutter/material.dart';
import 'package:routes/utils/constants.dart';
import 'package:routes/utils/data.dart';
import 'package:routes/widgets/list_container.dart';

bool isItemVisible(int index, BuildContext context) {
  RenderBox? renderBox =
      listKey.currentContext?.findRenderObject() as RenderBox?;
  final itemPosition = renderBox?.localToGlobal(Offset(0.0, index * ITEM_HEIGHT.toDouble()));
  final screenHeight = MediaQuery.of(context).size.height;
  return itemPosition!.dy >= 0 && itemPosition!.dy + ITEM_HEIGHT <= screenHeight;
}

double findItemPosition() {
  RenderBox renderBox = listKey.currentContext?.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  return position.dy;
}

List<double> doubleList = strikePriceList[0].map((string) {
  return double.parse(string);
}).toList();

String getNearbyIndex(searchtxt) {
  final greaterItem =
      doubleList.where((e) => e >= double.parse(searchtxt)).toList()..sort();
  return strikePriceList[0].indexOf(greaterItem[0].toString()).toString();
}

void scrollToIndex(int index, BuildContext context, Function checkOverlay) {
  double pos;
  if (!isItemVisible(index, context)) {
    controller
        .animateTo(
          (index.toDouble()) * ITEM_HEIGHT,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        )
        .then((value) =>
            {pos = findItemPosition() + (index * ITEM_HEIGHT), checkOverlay(pos)});
  } else {
    pos = findItemPosition() + (index * ITEM_HEIGHT);
    checkOverlay(pos);
  }
}

String getScreenBottomPosition(BuildContext context) =>
    (MediaQuery.of(context).size.height - 15).toString();
