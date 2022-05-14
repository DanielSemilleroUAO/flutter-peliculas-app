import 'package:flutter/material.dart';

class TextInput extends StatelessWidget{

  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  int maxlines = 1;

  TextInput({
    Key key,
    @required this.hintText,
    @required this.textInputType,
    @required this.controller,
    this.maxlines
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0
      ),
      child: TextField(
        maxLines: maxlines,
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5)
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0)
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFFe5e5e5)
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(9.0)
            ),
          )
        ),
      ),
    );
  }

}