import 'package:flutter/material.dart';
import 'package:todo_app/add/input_field.dart';

class Notes_Input_Field extends input_field {
  Notes_Input_Field({Key? key, name, txt, inputFieldCtrl}) : super(key: key, name: "Notes", txt: txt, inputFieldController: inputFieldCtrl );

  double height = 150, btm_padding = 10;


}
