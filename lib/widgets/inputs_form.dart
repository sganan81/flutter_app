import 'package:flutter/material.dart';

class InputsForm extends StatelessWidget {
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;

  final String inputName;
  final Map<String, dynamic> inputValues;
  
  
  const InputsForm({
    Key? key, 
    this.readOnly = false, 
    this.autofocus = false, 
    this.maxLength, 
    this.keyboardType, 
    this.obscureText = false, 
    this.enabled = true, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.suffixIcon, 
    required this.inputName, 
    required this.inputValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      readOnly: readOnly,
      enabled: enabled,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: (value) => inputValues[inputName] = value,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,                  
        prefixIcon: suffixIcon == null ? null : Icon(suffixIcon),                
      ),
      validator: (value) {

        if(value == null || value == '') return 'Campo requerido';
        return value.length < 3 ? 'Mínimo de 3 caraceteres': null;
      },
    );
  }
}