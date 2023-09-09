import 'package:flutter/material.dart';
import 'package:routes/bst/widgets/binary_tree_ui.dart';
import 'package:routes/bst/widgets/num_form.dart';
import '../constants.dart';

class BinaryMain extends StatelessWidget {
  const BinaryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_BAR_TITLE),
      ),
      body: Column(
        children: [
          NumberForm(),
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BinaryTreeList(),
            ),
          )
        ],
      ),
    );
  }
}
