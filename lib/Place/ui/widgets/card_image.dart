import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class  CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double widht;
  double left;
  VoidCallback onPressedFabIcon;
  final IconData iconData;
  final String pathImage;

  CardImageWithFabIcon({
    Key key,
    @required this.height=250.0,
    @required this.widht=350.0,
    @required this.pathImage,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.left=20
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: widht,
      margin: EdgeInsets.only(
        left: left
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData,onPressed: onPressedFabIcon,)
      ],
    );
  }

}