import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo_app/providers/timer_provider.dart';
import 'package:pomo_app/widgets/upper_card.dart';
import 'package:pomo_app/screens/home.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

class Continue extends StatelessWidget {
  const Continue({Key? key}) : super(key: key);

  //todo: make the stop button toggel to Continue and remove this page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff250F32),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: deviceSize!.height * 0.1,
            child: CircularPercentIndicator(
              animation: true,
              animateFromLastPercent: true,
              animationDuration: 1000,
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
            bottom: deviceSize!.height / 10,
            child: ElevatedButton(
                child: const Text('CONTINUE'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffF54C4C),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<TimerProvider>().startTimer();
                }),
          ),
        ],
      ),
    );
  }
}
