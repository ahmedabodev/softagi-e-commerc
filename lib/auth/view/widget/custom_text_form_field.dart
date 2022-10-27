import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class custom_text_form_field extends StatelessWidget {
var keyboardType;
TextEditingController? controller;

var onSaved;
Icon? suffixIcon;
Icon? prefixIcon;
String? hint;
bool? phone=false;
ValueChanged<String>? onSubmitted;
FormFieldValidator<String>? validator;
custom_text_form_field(
    {this.controller,this.validator,this.suffixIcon,this.prefixIcon, this.keyboardType, this.onSaved, this.hint,this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:(phone==true)?const EdgeInsetsDirectional.only(
          top: 15
      ): const EdgeInsetsDirectional.only(
        top: 0,bottom: 0
      ),
      child: TextFormField(
        controller: controller,
        maxLength:(phone==true)?11:null,
        validator: validator,
        keyboardType: keyboardType,
        onSaved: onSaved,
        decoration:  InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black
                ,width: 0.2

            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black
                ,width: 0.2

            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black
                ,width: 0.2

            ),
          ),

          labelText: hint,
          isDense: true,

          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Segoe',

          ),

        ),      ),
    );
  }
}
