import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/state_management/provider.dart';
import 'package:routes/utils/constants.dart';
import 'package:routes/utils/data.dart';
import 'package:routes/utils/common_functions.dart';
import 'package:routes/widgets/list_widget.dart';
import 'package:routes/widgets/overlay.dart';
import '../utils/styles.dart';

OverlayEntry? overlayEntry;
final ScrollController controller = ScrollController();
final GlobalKey listKey = GlobalKey();
String fIxedIndexPositon = INITIAL_INDEX_POSITION;

class ListContainer extends StatelessWidget {
  const ListContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<SearchProvider>(context);

    void removeOverlay() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    void showOverlay(index) {
      overlayEntry = createOverlayEntry(
        context,
        overlayEntry,
        index,
        inputProvider.searchtxt,
      );
      Overlay.of(context).insert(overlayEntry!);
    }

    void checkOverlay(index) {
      if (overlayEntry != null) {
        removeOverlay();
      }

      if (!isItemVisible(
          int.parse(getNearbyIndex(inputProvider.searchtxt)), context)) {
        RenderBox? renderBox =
            listKey.currentContext?.findRenderObject() as RenderBox?;
        final itemPosition = renderBox?.localToGlobal(Offset(0.0, index * ITEM_HEIGHT));

        double listViewTop = controller.position.viewportDimension -
            controller.position.extentInside;
        double listViewBottom = controller.position.viewportDimension;

        if (itemPosition!.dy >= listViewTop) {
          fIxedIndexPositon = getScreenBottomPosition(context);
        } else if (itemPosition.dy <= listViewBottom) {
          fIxedIndexPositon = INITIAL_INDEX_POSITION;
        }
        showOverlay(fIxedIndexPositon);
      } else {
        showOverlay(index.toString());
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients && inputProvider.searchtxt.isNotEmpty) {
        if (overlayEntry == null) {
          scrollToIndex(int.parse(getNearbyIndex(inputProvider.searchtxt)),
              context, checkOverlay);
        } else {
          removeOverlay();
          scrollToIndex(int.parse(getNearbyIndex(inputProvider.searchtxt)),
              context, checkOverlay);
        }

        controller.addListener(() {
          var pos = findItemPosition() +
              (double.parse(getNearbyIndex(inputProvider.searchtxt)) * ITEM_HEIGHT);
          checkOverlay(pos);
        });
      }
    });

    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              CALL_TXT,
              style: headerTxtStyle(),
            ),
            const Text(
              STRIKE_PRICE_TXT,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              PUT_TXT,
              style: headerTxtStyle(),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),

        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListWidget(
                    title: CALL_TXT,
                    item: optionList,
                    hasHorizontalList: true,
                    controller: controller,
                    globalKey: null),
                ListWidget(
                    title: STRIKE_PRICE_TXT,
                    item: strikePriceList,
                    hasHorizontalList: false,
                    controller: controller,
                    globalKey: listKey),
                ListWidget(
                    title: PUT_TXT,
                    item: optionList,
                    hasHorizontalList: true,
                    controller: controller,
                    globalKey: null),
              ],
            ),
          ),
        ),
        // ),),
      ],
    );
  }
}
