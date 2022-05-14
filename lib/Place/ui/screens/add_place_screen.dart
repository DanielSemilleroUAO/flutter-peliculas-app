import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/widgets/title_header.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen>{

  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 5.0
                ),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white,size: 45,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

            Flexible(
                child: Container(
                child: Container(
                    padding: EdgeInsets.only(
                      top: 45.0,
                      left: 20.0,
                      right: 10.0
                    ),
                    child: TitleHeader(title: "Add a new Place",),
                  )
                )
            ),
            ],
          ),

          Container(
              margin: EdgeInsets.only(
                top: 120.0,
                bottom: 20.0
              ),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                      height: 250.0,
                      widht: 350.0,
                      left: 0,
                      pathImage: widget.image.path,
                      onPressedFabIcon: () => {},
                      iconData: Icons.camera_alt
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    textInputType: null,
                    maxlines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                    hintText: "Description",
                    textInputType: TextInputType.multiline,
                    maxlines: 4,
                    controller: _controllerDescriptionPlace),
                Container(
                  margin: EdgeInsets.only(top:20.0),
                  child: TitleInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                  ),
                ),

                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: (){
                      //Firebase starage
                      //url
                      //ID DEL USUARIO
                      userBloc.currentUser.then((FirebaseUser user){
                        if(user != null){
                          String uid = user.uid;
                          String path = "${uid}/${DateTime.now().toString()}.jpg";

                          userBloc.uploadFile(path, widget.image)
                          .then((StorageUploadTask storageUploadTask){
                              storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot){
                                  snapshot.ref.getDownloadURL().then((urlImage){
                                    print("URLIMAGE: ${urlImage}");

                                    //Cloud Firestore
                                    //Place - title - url
                                    userBloc.updatePlaceData(Place(
                                      name: _controllerTitlePlace.text,
                                      description: _controllerDescriptionPlace.text,
                                      urlImage: urlImage,
                                      likes: 0,
                                    )).whenComplete(() {
                                      print("Termino");
                                      Navigator.pop(context);
                                    });

                                  });
                              });
                          });

                        }
                      });


                    },
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}