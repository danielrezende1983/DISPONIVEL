import 'package:flutter/material.dart';

Row statusDeCarregandoListTile(){
  return Row(
    // ignore: prefer_const_literals_to_create_immutables
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    ],
  );
}