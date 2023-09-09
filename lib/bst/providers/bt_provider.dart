import 'package:flutter/material.dart';
import 'package:routes/bst/modal/bt_modal.dart';

class BtProvider with ChangeNotifier {
  BinaryTreeModal? _modalObj;
  BinaryTreeModal? get modalObj => _modalObj;

  BinaryTreeModal _insertNumber(BinaryTreeModal? treeModalObj, int num) {
    if (treeModalObj == null) {
      // print("null matched $treeModalObj $num");
      return BinaryTreeModal(null, null, num);
    }
    if (num == treeModalObj.nodeValue! || num == 0) {
      // invalid
      // print(treeModalObj.nodeValue);
    } else if (num < treeModalObj.nodeValue!) {
      // print(treeModalObj.left);
      treeModalObj.left = _insertNumber(treeModalObj.left, num);
    } else {
      // print("right $treeModalObj $num");
      treeModalObj.right = _insertNumber(treeModalObj.right, num);
    }
    return treeModalObj;
  }

  void insertNumber(String num) {
    _modalObj = _insertNumber(_modalObj, int.parse(num));
    notifyListeners();
  }
}
