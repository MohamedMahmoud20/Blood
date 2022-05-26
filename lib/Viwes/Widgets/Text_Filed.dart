import 'package:flutter/material.dart';

import '../../Conests.dart';

class buildTextField extends StatelessWidget {
  IconData icon;
  String hintText;
  bool hide;
  var typekeyboard;
dynamic asmaa;
  dynamic hussein;
buildTextField(this.icon, this.hintText, this.hide, this.typekeyboard,this.asmaa,this.hussein);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(onChanged: hussein,
        validator: asmaa,
        obscureText: hide,
        keyboardType: typekeyboard,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.activeColor, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
