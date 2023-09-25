import 'package:flutter/material.dart';
import 'package:routes/utils/constants.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final List<List<String>> item;
  final bool hasHorizontalList;
  final ScrollController controller;
  final GlobalKey? globalKey;

  const ListWidget(
      {super.key,
      required this.title,
      required this.item,
      required this.hasHorizontalList,
      required this.controller,
      required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: LIST_HEIGHT,
      child: ListView.builder(
        padding: hasHorizontalList
            ? null
            : const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, rowIndex) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: hasHorizontalList ? 65 : 85,
                child: ListView.builder(
                  key: globalKey,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: item[rowIndex].length,
                  itemBuilder: (context, colIndex) {
                    return Container(
                      color:
                          hasHorizontalList ? Colors.black : Colors.green[900],
                      height: ITEM_HEIGHT.toDouble(),
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          item[rowIndex][colIndex],
                          style: TextStyle(
                              color: item[rowIndex][colIndex].contains("%")
                                  ? Colors.red[300]
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
