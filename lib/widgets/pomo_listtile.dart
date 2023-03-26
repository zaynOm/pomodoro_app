import 'package:pomo_app/screens/home.dart';
import 'package:flutter/material.dart';

class PomoListTile extends StatefulWidget {
  final String title;
  Color color;
  PomoListTile({Key? key, required this.title, this.color = Colors.white54})
      : super(key: key);

  @override
  State<PomoListTile> createState() => _PomoListTileState();
}

class _PomoListTileState extends State<PomoListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: deviceSize!.width * 0.5,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(8, 8),
          )
        ],
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 30.0, letterSpacing: 5),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
