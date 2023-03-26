import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomo_app/providers/channel_provider.dart';
import 'package:pomo_app/screens/started_timer.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  static const int _pomoInSec = 10;
  static const int _breakInSec = 5;
  int round = 1;
  int _current = _pomoInSec;

  int get time => _current;

  num get getStart => _pomoInSec;

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    // while (round < 4) {
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_current > 0) {
          _current--;
          notifyListeners();
        } else {
          StartedTimer.isTimerActive = false;
          resetTimer();
          ChannelProvider().startRingtone();
          notifyListeners();
        }
      },
    );
    //   round++;
    // }
  }

  void stopTimer() {
    _timer.cancel();
  }

  void resetTimer() {
    _timer.cancel();
    _current = _pomoInSec;
    notifyListeners();
  }
}
