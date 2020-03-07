import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/save.dart';
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
                ),
                fontFamily: 'Raleway',
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;
    
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    Save save = Save();
    Map<String, Value> values = {
        'Stopwatch': Value<Duration>.withValue(Duration()),
        'Team Number': Value<String>.withValue(''),
        'Ball Count of Lower Hole / Teleop': Value<int>.withValue(0),
        'Ball Count of Upper Hole / Teleop': Value<int>.withValue(0),
        'Ball Count of Small Hole / Teleop': Value<int>.withValue(0),
        'Ball Count of Lower Hole / Autonomous': Value<int>.withValue(0),
        'Ball Count of Upper Hole / Autonomous': Value<int>.withValue(0),
        'Ball Count of Small Hole / Autonomous': Value<int>.withValue(0),
        'Staying in Balance': Value<bool>.withValue(false),
        'Can Adjust Balance': Value<bool>.withValue(false),
        'Moved Away From Line': Value<bool>.withValue(false),
        'Did Trench Run': Value<bool>.withValue(false),
        'Bar Climb Time': Value<Duration>.withValue(Duration()),
        'Control Panel': Value<String>.withValue(''),
        'Notes': Value<String>.withValue(''),
    };
    
    Map<String, VirtualKeyboardType> keyboardType = {
        'Team Number': VirtualKeyboardType.Numeric,
        'Notes': VirtualKeyboardType.Alphanumeric,
    };
    String selected = '';
    
    String text = '';
    
    bool shiftEnabled = false;
    
    _onKeyPress(VirtualKeyboardKey key) {
        if (key.keyType == VirtualKeyboardKeyType.String) {
            text = text + (shiftEnabled ? key.capsText : key.text);
        } else if (key.keyType == VirtualKeyboardKeyType.Action) {
            switch (key.action) {
                case VirtualKeyboardKeyAction.Backspace:
                    if (text.length == 0) return;
                    text = text.substring(0, text.length - 1);
                    break;
                case VirtualKeyboardKeyAction.Return:
                    text = text + '\n';
                    break;
                case VirtualKeyboardKeyAction.Space:
                    text = text + key.text;
                    break;
                case VirtualKeyboardKeyAction.Shift:
                    shiftEnabled = !shiftEnabled;
                    break;
                default:
            }
        }
        
        setState(() {
            values[selected].value = text;
        });
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                actions: <Widget>[
                    IconButton(
                        onPressed: () {
                            setState(() {
                                locale.lang = locale.lang == Language.en ? Language.tr : Language.en;
                            });
                        },
                        icon: Icon(Icons.translate),
                    ),
                    IconButton(
                        onPressed: () {
                            save.save(values.values);
                            setState(() {
                                values = {
                                    'Stopwatch': Value<Duration>.withValue(Duration()),
                                    'Team Number': Value<String>.withValue(''),
                                    'Ball Count of Lower Hole / Teleop': Value<int>.withValue(0),
                                    'Ball Count of Upper Hole / Teleop': Value<int>.withValue(0),
                                    'Ball Count of Small Hole / Teleop': Value<int>.withValue(0),
                                    'Ball Count of Lower Hole / Autonomous': Value<int>.withValue(0),
                                    'Ball Count of Upper Hole / Autonomous': Value<int>.withValue(0),
                                    'Ball Count of Small Hole / Autonomous': Value<int>.withValue(0),
                                    'Staying in Balance': Value<bool>.withValue(false),
                                    'Can Adjust Balance': Value<bool>.withValue(false),
                                    'Moved Away From Line': Value<bool>.withValue(false),
                                    'Did Trench Run': Value<bool>.withValue(false),
                                    'Bar Climb Time': Value<Duration>.withValue(Duration()),
                                    'Control Panel': Value<String>.withValue(''),
                                    'Notes': Value<String>.withValue(''),
                                };
                            });
                        }, icon: Icon(Icons.save),
                    ),
                    Builder(
                        builder: (context) {
                            return IconButton(
                                onPressed: () {
                                    save.getClipboard(context);
                                }, icon: Icon(Icons.content_copy),
                            );
                        },
                    ),
                    Builder(
                        builder: (context) {
                            return IconButton(
                                onPressed: () {
                                    save.erase(context);
                                }, icon: Icon(Icons.clear),
                            );
                        },
                    ),
                ],
            ),
            body: Center(
                child: Column(
                    children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                    setState(() {
                                        selected = '';
                                    });
                                },
                                child: ListView(
                                    children: <Widget>[
                                        StopwatchInput(
                                            title: 'Stopwatch',
                                            value: values['Stopwatch'],
                                        ),
                                        TextInput(
                                            title: 'Team Number',
                                            value: values['Team Number'],
                                            multiline: false,
                                            onTap: () {
                                                setState(() {
                                                    selected = 'Team Number';
                                                    text = values[selected].value;
                                                });
                                            },
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Lower Hole / Teleop',
                                            value: values['Ball Count of Lower Hole / Teleop'],
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Upper Hole / Teleop',
                                            value: values['Ball Count of Upper Hole / Teleop'],
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Small Hole / Teleop',
                                            value: values['Ball Count of Small Hole / Teleop'],
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Lower Hole / Autonomous',
                                            value: values['Ball Count of Lower Hole / Autonomous'],
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Upper Hole / Autonomous',
                                            value: values['Ball Count of Upper Hole / Autonomous'],
                                        ),
                                        CounterInput(
                                            title: 'Ball Count of Small Hole / Autonomous',
                                            value: values['Ball Count of Small Hole / Autonomous'],
                                        ),
                                        CheckboxInput(
                                            title: 'Staying in Balance',
                                            value: values['Staying in Balance'],
                                        ),
                                        CheckboxInput(
                                            title: 'Can Adjust Balance',
                                            value: values['Can Adjust Balance'],
                                        ),
                                        CheckboxInput(
                                            title: 'Moved Away From Line',
                                            value: values['Moved Away From Line'],
                                        ),
                                        CheckboxInput(
                                            title: 'Did Trench Run',
                                            value: values['Did Trench Run'],
                                        ),
                                        StopwatchInput(
                                            title: 'Bar Climb Time',
                                            value: values['Bar Climb Time'],
                                        ),
                                        SelectorInput(
                                            title: 'Control Panel',
                                            value: values['Control Panel'],
                                            choices: [
                                                '',
                                                'None',
                                                '3 lap',
                                                '3 lap with precise alignment'
                                            ],
                                        ),
                                        TextInput(
                                            title: 'Notes',
                                            value: values['Notes'],
                                            multiline: true,
                                            onTap: () {
                                                setState(() {
                                                    selected = 'Notes';
                                                    text = values[selected].value;
                                                });
                                            },
                                        ),
                                    ],
                                ),
                            ),
                        ),
                        selected != '' ? Container(
                            color: Colors.pinkAccent,
                            child: VirtualKeyboard(
                                fontSize: 17,
                                type: keyboardType[selected],
                                // Callback for key press event
                                onKeyPress: _onKeyPress,
                            ),
                        ) : Container(),
                    ],
                ),
            ),
        );
    }
}
