import 'package:pomo_app/widgets/pomo_listtile.dart';
import 'package:pomo_app/screens/home.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

class PomosList extends StatelessWidget with ChangeNotifier {
  List<String> pomoList = ['Work', 'Study', 'Train', 'sleep'];
  final ScrollController _controller = ScrollController();
  PomosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //TODO: make scroll smother
      // controller: _controller,
      scrollDirection: Axis.horizontal,
      itemCount: context.watch<PomosList>().pomoList.length,
      itemBuilder: (_, index) {
        return PomoListTile(
          title: context.watch<PomosList>().pomoList[index].toUpperCase(),
          color: Colors.white70,
        );
      },
      separatorBuilder: (_, index) {
        return SizedBox(
          width: deviceSize!.width * 0.01,
        );
      },
    );
  }

  void addToPomoList(String value) {
    if (value.isNotEmpty) {
      pomoList.add(value);
      notifyListeners();
    }
  }
}
