import 'package:flutter/material.dart';

Text textDull(String str) {
  return Text(
    str,
    style: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(107, 0, 0, 0),
        letterSpacing: 2),
  );
}

SizedBox sizedHeightBox() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox sizedWidthBox() {
  return const SizedBox(
    width: 10,
  );
}
