import 'package:flutter/material.dart';
import 'package:scouting_app/decoration.dart';
import 'package:scouting_app/file.dart';
import 'package:scouting_app/screen/input.dart';
import 'package:scouting_app/screen/qr.dart';
import 'package:scouting_app/style.dart';
import 'package:scouting_app/localization.dart';

class MainScreen extends StatefulWidget {
    @override
    _MainScreenState createState() => _MainScreenState();
}

String lang = 'en';

class _MainScreenState extends State<MainScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'Main Screen'.lang(lang),
                    style: titleTextStyle(context),
                ),
                actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.translate),
                      onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                  return SimpleDialog(
                                      backgroundColor: Color(0x00000000),
                                      children: <Widget>[
                                          Card(
                                              child: Container(
                                                  decoration: cardDecoration(context),
                                                  child: ListTile(
                                                      title: Text(
                                                          'English'.lang(lang),
                                                          style: mediumTextStyle(context),
                                                      ),
                                                      onTap: () {
                                                          setState(() {
                                                              lang = 'en';
                                                              Navigator.pop(context);
                                                          });
                                                      },
                                                  ),
                                              ),
                                          ),
                                          Card(
                                              child: Container(
                                                  decoration: cardDecoration(context),
                                                  child: ListTile(
                                                      title: Text(
                                                          'Turkish'.lang(lang),
                                                          style: mediumTextStyle(context),
                                                      ),
                                                      onTap: () {
                                                          setState(() {
                                                              lang = 'tr';
                                                              Navigator.pop(context);
                                                          });
                                                      },
                                                  ),
                                              ),
                                          ),
                                      ],
                                  );
                              },
                          );
                      }),
                ],
            ),
            body: Container(
                decoration: scaffoldDecoration(context),
                child: Center(
                    child: Column(
                        children: <Widget>[
                            Card(
                                child: Container(
                                    decoration: cardDecoration(context),
                                    child: ListTile(
                                        title: Text(
                                            'Input Screen'.lang(lang),
                                            style: cardStyle(context),
                                        ),
                                        onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                        return InputScreen();
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                            ),
                            Card(
                                child: Container(
                                    decoration: cardDecoration(context),
                                    child: ListTile(
                                        title: Text(
                                            'QR Screen'.lang(lang),
                                            style: cardStyle(context),
                                        ),
                                        onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                        return QRScreen();
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }

    @override
    void initState() {
        super.initState();
        try {
            readFile().then((value) {
                writeFile(value);
            });
        }
        catch (e) {
            writeFile('');
        }
    }
}
