import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo_app/providers/channel_provider.dart';
import 'package:pomo_app/providers/timer_provider.dart';
import 'package:pomo_app/screens/started_timer.dart';
import 'package:pomo_app/widgets/pomos_listvew.dart';
import 'package:pomo_app/widgets/upper_card.dart';
import 'package:pomo_app/screens/add_timer.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

late Size? deviceSize;

// todo convert to stateless widget
class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  /* @override
  void initState() {
    super.initState();
    getRingtones();
  } */

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    //? implementation of Stack widget
    return Scaffold(
      backgroundColor: const Color(0xff250F32),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: deviceSize!.height / 10,
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
          //todo: fix this
          Positioned(
            left: 0,
            top: deviceSize!.height * 0.4,
            right: 0,
            bottom: deviceSize!.height * 0.2,
            child: PomosList(),
          ),
          Positioned(
            bottom: deviceSize!.height / 10,
            child: ElevatedButton(
                child: const Text('START'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(letterSpacing: 2),
                  primary: const Color(0xffF54C4C),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartedTimer()),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF54C4C),
        child: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          context.read<ChannelProvider>().getRingtones();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTimer()),
          );
        },
      ),
    );
  }
}


/* DropdownButton<Object?>(
            items: result.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            icon: const Icon(Icons.music_note),
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue.toString();
                setRingtone();
              });
            },
            value: dropdownValue,
          ), */


          /* Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'pomos'),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'sets'),
                  ),
                ),
              ],
            ),
          ), */

           //? implementation of Stack widget
          /* return Scaffold(
      backgroundColor: const Color(0xff250F32),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: deviceSize!.height / 10,
            child: CircularPercentIndicator(
              animation: true,
              animateFromLastPercent: true,
              animationDuration: 9000,
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
          //todo: fix this
          Positioned(
            height: deviceSize!.height * 0.3,
            bottom: deviceSize!.height * 0.3,
            child: PomosList(),
          ),
          Positioned(
            bottom: deviceSize!.height / 10,
            child: ElevatedButton(
                child: const Text('START'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(letterSpacing: 2),
                  primary: const Color(0xffF54C4C),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartedTimer()),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF54C4C),
        child: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          context.read<ChannelProvider>().getRingtones();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTimer()),
          );
        },
      ),
    ); */