import 'package:flutter/material.dart';

enum HPSizeTitle {
  small(size: 17.0),
  normal(size: 20.0),
  large(size: 25.0);

  final double size;
  const HPSizeTitle({required this.size});
}

class HpTextTitle extends StatelessWidget {
  final String text; //string é a tipagem da variavel final text
  final HPSizeTitle size;
  final Color? color;
  const HpTextTitle(
      {super.key, required this.text, required this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size.size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
