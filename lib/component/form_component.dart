import 'package:flutter/material.dart';

Padding inputForm(
  Function(String?) validasi, {
  required TextEditingController controller,
  required String hintText,
  required String helperText,
  required IconData iconData,
  bool password = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: SizedBox(
      width: 350,
      child: TextFormField(
        validator: (value) => validasi(value),
        autofocus: true,
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          helperText: helperText,
          prefixIcon: Icon(iconData),
        ),
      ),
    ),
  );
}
