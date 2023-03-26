import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final String firstLine;
  int? defaultValue;
  final TextInputType keyType;
  TextEditingController? tdController;

  CustomTextField(
      {Key? key,
      required this.width,
      required this.firstLine,
      this.defaultValue,
      this.keyType = TextInputType.number,
      this.tdController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        maxLines: 2,
        textAlign: TextAlign.center,
        keyboardType: keyType,
        controller: tdController,
        style: const TextStyle(
          color: Colors.white54,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
        ),
        decoration: InputDecoration(
          hintText: firstLine,
          hintStyle: const TextStyle(color: Colors.white54),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.white54, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xffF54C4C), width: 2),
          ),
        ),
      ),
    );
  }
}
