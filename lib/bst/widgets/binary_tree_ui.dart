import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/bst/modal/bt_modal.dart';
import 'package:routes/bst/providers/bt_provider.dart';
import 'package:routes/bst/widgets/arrow.dart';

import 'package:routes/bst/widgets/node.dart';

class BinaryTreeList extends StatelessWidget {
  const BinaryTreeList({super.key});
  @override
  Widget build(BuildContext context) {
    final treeModel = Provider.of<BtProvider>(context);
    return drawTree(treeModel.modalObj);
  }

  Widget drawTree(BinaryTreeModal? modalObj) {
    if (modalObj == null) {
      return const SizedBox();
    }
    return AnimatedCrossFade(
      crossFadeState: CrossFadeState.showFirst,
      duration: const Duration(seconds: 1),
      secondChild: const SizedBox(),
      firstChild: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            node(modalObj),
            arrow(modalObj),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: drawTree(modalObj.left),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: drawTree(modalObj.right),
                ),
              ],
            ),
          ],
        ),
        // ),
        // ),
      ),
    );
  }
}
