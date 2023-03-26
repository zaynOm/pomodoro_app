import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ChannelProvider with ChangeNotifier {
  List<Object?> result = [""];
  String dropdownValue = "";
  bool isPlaying = false;

  static const channel = MethodChannel('com.example.pomo_app/mychannel');

  set setDropdownValue(value) {
    dropdownValue = value;
    notifyListeners();
  }

  Future<void> getRingtones() async {
    var res = await channel.invokeMethod('getAllRingtones');
    result = res;
    dropdownValue = result.first.toString();
  }

  Future<void> setRingtone() async {
    try {
      channel.invokeMethod('setRingtone', {'ringtoneName': dropdownValue});
    } on PlatformException catch (e) {
      print('Exception: $e.message');
    }
  }

  Future<void> startRingtone() async {
    if (!isPlaying) {
      channel.invokeMethod('startRingtone');
      isPlaying = true;
    }
  }

  Future<void> stopRingtone() async {
    channel.invokeMethod('stopRingtone');
    isPlaying = false;
  }
}
