import 'package:flutter/material.dart';

class VSpacer extends StatelessWidget {

  final double size;

  const VSpacer(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}

class HSpacer extends StatelessWidget {

  final double size;

  const HSpacer(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
