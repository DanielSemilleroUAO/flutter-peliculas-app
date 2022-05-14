import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget{

  final String title;
  double withScreen;

  TitleHeader({
    Key key,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    withScreen = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
    );
  }

}