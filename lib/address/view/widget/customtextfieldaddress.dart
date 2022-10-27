import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class custom_text_form_fieldAddress extends StatelessWidget {
  var keyboardType;
  TextEditingController? controller;
  String? textname;
  var onSaved;
  Icon? suffixIcon;
  Icon? prefixIcon;
  String? hint;
  bool? phone=false;
  ValueChanged<String>? onSubmitted;
  FormFieldValidator<String>? validator;
  custom_text_form_fieldAddress(
      {this.textname,this.controller,this.validator,this.suffixIcon,this.prefixIcon, this.keyboardType, this.onSaved, this.hint,this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:(phone==true)?const EdgeInsetsDirectional.only(
          top: 15
      ): const EdgeInsetsDirectional.only(
          top: 0,bottom: 0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(textname.toString(),style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Segoe'
          ),),
          TextFormField(
            controller: controller,
            maxLength:(phone==true)?11:null,
            validator: validator,
            keyboardType: keyboardType,
            onChanged: onSaved,
            decoration:  InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent
                    ,width: 0

                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent
                    ,width: 0

                ),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent
                    ,width: 0

                ),
              ),

              hintText: hint,
              isDense: true,

              labelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Segoe',

              ),
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Segoe',

              ),

            ),      ),
        ],
      ),
    );
  }
}
