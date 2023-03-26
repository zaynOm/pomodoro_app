import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo_app/providers/channel_provider.dart';
import 'package:pomo_app/providers/timer_provider.dart';
import 'package:pomo_app/widgets/upper_card.dart';
import 'package:pomo_app/screens/continue.dart';
import 'package:pomo_app/screens/home.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

class StartedTimer extends StatefulWidget {
  const StartedTimer({Key? key}) : super(key: key);
  static bool isTimerActive = false;

  @override
  State<StartedTimer> createState() => _StartedTimerState();
}

class _StartedTimerState extends State<StartedTimer> {
  @override
  void initState() {
    if (StartedTimer.isTimerActive == false) {
      context.read<TimerProvider>().startTimer();
      StartedTimer.isTimerActive = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff250F32),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: deviceSize!.height * 0.1,
            child: CircularPercentIndicator(
              animation: true,
              animateFromLastPercent: true,
              animationDuration: 500,
              radius: deviceSize!.width * 0.5,
              backgroundColor: Colors.white24,
              progressColor: const Color(0xffF54C4C),
              percent: context.watch<TimerProvider>().time /
                  context.watch<TimerProvider>().getStart,
              lineWidth: 15,
              circularStrokeCap: CircularStrokeCap.round,
              center: const Count(),
            ),
          ),
          Positioned(
            height: 60,
            top: deviceSize!.height * 0.4,
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white54, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ROUND',
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  ),
                  Text(
                    context.watch<TimerProvider>().round.toString() + '/4',
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: deviceSize!.height * 0.1,
            width: deviceSize!.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: const Text('STOP'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(letterSpacing: 2),
                      primary: const Color(0xffF54C4C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Continue()),
                      );
                      context.read<TimerProvider>().stopTimer();
                      context.read<ChannelProvider>().stopRingtone();
                    }),
                ElevatedButton(
                    child: const Text('RESET'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(letterSpacing: 2),
                      primary: const Color(0xffF54C4C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<TimerProvider>().resetTimer();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
