import 'package:flutter/material.dart';
import 'package:plantapp/constans/constans.dart';

class CustomerFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Object? initialValue;
  final Function(String)? onChanged;
  final String labelName;
  final TextDirection textDirection;

  const CustomerFormField({
    super.key,
    this.validator,
    this.initialValue,
    this.onChanged,
    required this.labelName,
    required this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        initialValue: initialValue != null ? initialValue.toString() : '',
        onChanged: onChanged,
        cursorColor: Constans.primaryColor,
        style: const TextStyle(
          fontSize: 20.0,
          height: 2.0,
        ),
        textDirection: textDirection,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.redAccent),
          hintTextDirection: TextDirection.rtl,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Constans.primaryColor,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          label: Text(
            labelName,
            style: TextStyle(
              fontSize: 20.0,
              color: Constans.primaryColor,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
