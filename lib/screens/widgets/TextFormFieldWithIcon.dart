import 'package:flutter/material.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon(
      {this.controller,
      this.iconPrefix,
      this.labelText,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText,
      this.minLines = 1,
      this.maxLines,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.hintText});

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final String initialValue;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText ?? "labelText",
          icon: Icon(iconPrefix ?? Icons.info),
          hintText: hintText ?? "Escriba su texto",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        maxLines: maxLines,
        minLines: minLines,
        validator: validator,
        initialValue: initialValue,
      ),
    );
  }
}
