import 'package:flutter/material.dart';

Widget buildTextField(
    String label, String prefix, TextEditingController controller, Function f) {
  return TextField(
    onChanged: (text) {
      f(text);
    },
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixText: prefix,
      labelStyle: const TextStyle(color: Colors.amber),
      prefixStyle: const TextStyle(color: Colors.amber, fontSize: 20),
      border: const OutlineInputBorder(),
    ),
    style: const TextStyle(color: Colors.amber, fontSize: 20),
    keyboardType: TextInputType.number,
  );
}
