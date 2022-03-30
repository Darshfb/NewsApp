import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  int? maxLines;
  TextAlign? textAlign;
  CustomText(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.textAlign,
      this.maxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
