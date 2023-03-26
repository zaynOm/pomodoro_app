import 'package:flutter/material.dart';
import 'package:pomo_app/providers/timer_provider.dart';
import 'package:provider/src/provider.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget stopButton = TextButton(
      child: const Text("Stop"),
      onPressed: () {
        context.read<TimerProvider>().stopTimer();
      },
    );
    Widget resetButton = TextButton(
      child: const Text("Reset"),
      onPressed: () {
        context.read<TimerProvider>().resetTimer();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text("Test Dialog"),
      content: const Text("hiiii"),
      actions: [
        stopButton,
        resetButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
