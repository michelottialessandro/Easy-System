// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mybutton extends CupertinoButton {
  Mybutton(text, fn, {Key? key})
      : super(
            key: key,
            child: Text(text,
                style: const TextStyle(fontSize: 18, color: Colors.black)),
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
            onPressed: fn);
}

BoxDecoration BDecoration(var colore) {
  return BoxDecoration(color: colore);
}

TextField ContainerBuilder(
    {var colore, required String text, controller, var tcolor}) {
  return TextField(
    controller: controller,
    cursorRadius: const Radius.circular(20),
    cursorColor: tcolor,
    decoration: InputDecoration(
      fillColor: colore,
      filled: true,
      border: const OutlineInputBorder(),
      hintText: text,
      hintStyle: TextStyle(
        color: tcolor,
        fontSize: 14,
      ),
      label: Text(text),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        // fontSize: 4,
      ),
    ),
  );
}
