import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo_app/widgets/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pomo_app/providers/timer_provider.dart';

class UpperCard extends StatelessWidget {
  const UpperCard({Key? key}) : super(key: key);

  static bool isTimerActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      width: MediaQuery.of(context).size.width,
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          height: 400.0,
          width: 400.0,
          child: CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 9000,
            radius: 250,
            progressColor: Colors.red,
            percent: context.watch<TimerProvider>().time / 100,
            lineWidth: 15,
            circularStrokeCap: CircularStrokeCap.round,
            center: const Count(),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("start"),
                  onPressed: () {
                    if (isTimerActive == false) {
                      isTimerActive = true;
                      context.read<TimerProvider>().startTimer();
                    }
                  },
                ),
                ElevatedButton(
                    child: const Text("pause"),
                    onPressed: () {
                      context.read<TimerProvider>().stopTimer();
                      isTimerActive = false;
                    }),
                ElevatedButton(
                  child: const Text("cancel"),
                  onPressed: () {
                    context.read<TimerProvider>().resetTimer();
                    isTimerActive = false;
                  },
                ),
                ElevatedButton(
                  child: const Text("run Dialog"),
                  onPressed: () {
                    const MyAlertDialog().showAlertDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<TimerProvider>().time}',
      key: const Key('counterState'),
      style: const TextStyle(color: Colors.white, fontSize: 50),
    );
  }
}
