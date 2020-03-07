import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/save.dart';
import 'package:scouting_app_rewrite/screen/main.dart';
import 'package:scouting_app_rewrite/type/checkbox.dart';
import 'package:scouting_app_rewrite/type/counter.dart';
import 'package:scouting_app_rewrite/type/selector.dart';
import 'package:scouting_app_rewrite/type/stopwatch.dart';
import 'package:scouting_app_rewrite/type/text.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

import 'type/value.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scouting App',
            theme: ThemeData(
                backgroundColor: Color(0xffe5def8),
                primarySwatch: MaterialColor(
                    0xfff451b0,
                    <int, Color>{
                        50: Color(0xfffce3f2),
                        100: Color(0xfff7b8de),
                        200: Color(0xfff488c8),
                        300: Color(0xfff451b0),
                        400: Color(0xfff5039b),
                        500: Color(0xfff50084),
                        600: Color(0xffe3007f),
                        700: Color(0xffcb0079),
                        800: Color(0xffb40073),
                        900: Color(0xff8b006a),
                    },
                ),
                cardTheme: CardTheme(
                    margin: EdgeInsets.all(8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(6),
                        ),
                    ),
                    color: Color(0xfffce3f2),
                ),
                fontFamily: 'Raleway',
            ),
            home: MainScreen(title: 'Flutter Demo Home Page'),
        );
    }
}
