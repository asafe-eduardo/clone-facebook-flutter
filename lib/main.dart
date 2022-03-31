import 'package:facebook_interface_aula/telas/home.dart';
import 'package:facebook_interface_aula/telas/principal.dart';
import 'package:facebook_interface_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffold
    ),
    // home: Home(),
    home: Principal(),
  ));
}
