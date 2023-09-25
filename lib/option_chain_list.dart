import 'package:flutter/material.dart';
import 'package:routes/widgets/list_container.dart';
import 'package:routes/widgets/searchbar.dart';

class OptionChainList extends StatelessWidget {
  const OptionChainList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: OptionSearchBar(),
      ),
      body: ListContainer(),
      backgroundColor: Colors.black,
    );
  }
}
