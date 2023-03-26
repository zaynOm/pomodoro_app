import 'package:flutter/material.dart';
import 'package:pomo_app/app.dart';
import 'package:pomo_app/providers/channel_provider.dart';
import 'package:pomo_app/providers/timer_provider.dart';
import 'package:pomo_app/widgets/pomos_listvew.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => ChannelProvider()),
        ChangeNotifierProvider(create: (_) => PomosList()),
      ],
      child: const MyApp(),
    ),
  );
}
