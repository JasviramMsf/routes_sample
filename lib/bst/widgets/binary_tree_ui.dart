import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/bst/modal/bt_modal.dart';
import 'package:routes/bst/providers/bt_provider.dart';
import 'dart:math' as math;

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
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.yellow, width: 2)),
              child: InkWell(
                child: Text(
                  modalObj.nodeValue.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 15),
                ),
              ),
            ),

            //node arrow
            Row(children: [
              modalObj.left != null
                  ? Transform.rotate(
                      angle: 60 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 30,
                      ),
                    )
                  : const SizedBox(),
              modalObj.right != null
                  ? Transform.rotate(
                      angle: 300 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 30,
                      ),
                    )
                  : const SizedBox(),
            ]),

            //sub node-left,right
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
