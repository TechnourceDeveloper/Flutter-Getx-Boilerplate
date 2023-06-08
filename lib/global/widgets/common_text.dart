import 'package:flutter/cupertino.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final TextStyle? styleText;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;

  const CommonText(
      {Key? key,
      this.maxLines,
      this.text,
      this.styleText,
      this.textAlign,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: styleText,
        maxLines: maxLines,
        textAlign: textAlign,
        textDirection: textDirection);
  }
}
