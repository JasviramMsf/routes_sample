import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:routes/state_management/provider.dart';
import 'package:routes/utils/common_functions.dart';
import 'package:routes/utils/constants.dart';
import 'package:routes/utils/data.dart';
import 'package:routes/widgets/toastmsg.dart';

class OptionSearchBar extends StatelessWidget {
  const OptionSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<SearchProvider>(context);
    final searchInputController = TextEditingController();
    double lowest = doubleList.reduce(min);
    double highest = doubleList.reduce(max);

    void searchSpotPrice() {

      if (searchInputController.text.isNotEmpty) {
        final String searchTxt = double.parse(searchInputController.text).toStringAsFixed(1);
        double searchTxtDouble = double.parse(searchTxt);
        if (!strikePriceList[0].contains(searchTxtDouble.toString())) {
          if ((searchTxtDouble >= lowest) && (searchTxtDouble <= highest)) {
            inputProvider.setSearchtxt(searchTxt.toString());
          } else {
            showSnackBar(context, NOT_IN_RANGE_ERROR);
          }
        } else {
          inputProvider.setSearchtxt(searchTxt);
        }
      } else {
        showSnackBar(context, ERROR_SPOT_MSG);
      }
    }

    return AppBar(
      title: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.black,
        ),
        child: TextField(
          // maxLength: 5,
          controller: searchInputController,
          style: const TextStyle(color: Colors.white),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(SPOT_PRICE_REGEX_VALIDATION),
            ),
                    LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            hintText: SEARCH_TXT,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: searchSpotPrice),
          ),
        ),
      ),
    );
  }
}
