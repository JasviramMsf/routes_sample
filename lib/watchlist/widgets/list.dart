import 'package:flutter/material.dart';
import 'package:routes/watchlist/bloc/watchlist_repo_bloc.dart';
import 'package:routes/watchlist/bloc/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/watchlist/utils/constants.dart';
import 'package:routes/watchlist/widgets/error_display.dart';
import 'package:routes/watchlist/utils/list_seperation.dart';
import 'package:routes/watchlist/modal/watchlist_modal.dart';
import 'package:routes/watchlist/widgets/item_card.dart';

class WatchListUi extends StatefulWidget {
  const WatchListUi(this.selectedIndex, {super.key});
  final int selectedIndex;
  @override
  State<WatchListUi> createState() => _WatchListUi();
}

class _WatchListUi extends State<WatchListUi> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
        _toggleContainer();
    });
  }

  _toggleContainer() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    setListIndex(widget.selectedIndex);

    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is InitialWatchlistState) {
          return SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            child: const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
                strokeWidth: 5,
              ),
            ),
          );
        } else if (state is UpdatedWatchlistState) {
          List<WatchlistModal> list =
              state.newList.sublist(subList[START]!, subList[END]);
          return ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.vertical,
                  child: itemCard(
                    list[index],
                  ));
            },
          );
        } else if (state is JsonErrorState) {
          return errorDisplay;
        } else {
          return errorDisplay;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
