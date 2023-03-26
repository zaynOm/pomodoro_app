import 'package:pomo_app/providers/channel_provider.dart';
import 'package:pomo_app/widgets/custom_text_field.dart';
import 'package:pomo_app/widgets/pomos_listvew.dart';
import 'package:pomo_app/screens/home.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AddTimer extends StatelessWidget {
  AddTimer({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff250F32),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                width: deviceSize!.width * 0.9,
                firstLine: 'TIMER LABEL',
                keyType: TextInputType.text,
                tdController: _textController,
              ),
              // const SizedBox(
              //   height: 300,
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        width: deviceSize!.width * 0.3,
                        firstLine: 'FOUCUS',
                      ),
                      CustomTextField(
                        width: deviceSize!.width * 0.3,
                        firstLine: 'SHORT BREAK',
                      ),
                      CustomTextField(
                        width: deviceSize!.width * 0.3,
                        firstLine: 'LONG BREAK',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        width: deviceSize!.width * 0.45,
                        firstLine: 'ROUNDS',
                      ),
                      CustomTextField(
                        width: deviceSize!.width * 0.45,
                        firstLine: 'ROUNDS TO LONG BREAK',
                      )
                    ],
                  ),
                ],
              ),

              //todo: make the ringtone fade out smoutly
              DropdownButton<Object?>(
                dropdownColor: const Color(0xff250F32),
                style: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2),
                items: context.watch<ChannelProvider>().result.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                icon: const Icon(Icons.music_note),
                onChanged: (newValue) {
                  context.read<ChannelProvider>().setDropdownValue =
                      newValue.toString();
                  context.read<ChannelProvider>().setRingtone();
                  context.read<ChannelProvider>().startRingtone();
                  Timer(const Duration(seconds: 4),
                      () => context.read<ChannelProvider>().stopRingtone());
                },
                value: context.watch<ChannelProvider>().dropdownValue,
              ),
              ElevatedButton(
                child: const Text('ADD TIMER'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffF54C4C),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {
                  context.read<PomosList>().addToPomoList(_textController.text);
                  context.read<ChannelProvider>().stopRingtone();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )));
  }
}
