import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/save.dart';
import 'package:scouting_app_rewrite/type/checkbox.dart';
import 'package:scouting_app_rewrite/type/counter.dart';
import 'package:scouting_app_rewrite/type/selector.dart';
import 'package:scouting_app_rewrite/type/stopwatch.dart';
import 'package:scouting_app_rewrite/type/text.dart';
import 'package:scouting_app_rewrite/type/value.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class MainScreen extends StatefulWidget {
    MainScreen({Key key, this.title}) : super(key: key);
    final String title;
    
    @override
    _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
    Save save = Save();
    Map<String, Value> values = {
        'Match Number': Value<String>.withValue(''),
        'Color': Value<String>.withValue(''),
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
        'Match Number': VirtualKeyboardType.Alphanumeric,
        'Team Number': VirtualKeyboardType.Numeric,
        'Notes': VirtualKeyboardType.Alphanumeric,
    };
    String selected = '';
    
    String text = '';
    
    bool shiftEnabled = false;
    
    AnimationController controller;
    AnimationController otherController;
    Animation<double> otherAnimation;
    bool isOpen = false;
    
    
    @override
    void initState() {
        super.initState();
        controller = AnimationController(
            duration: const Duration(milliseconds: 500),
            vsync: this,
        );
        otherController = AnimationController(
            duration: const Duration(milliseconds: 500),
            vsync: this,
        );
        otherAnimation = CurvedAnimation(
          parent: otherController,
          curve: Curves.easeOutQuart
        );
    }
    
    
    @override
    void dispose() {
        controller.dispose();
        otherController.dispose();
        super.dispose();
    }
    
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
                titleSpacing: 8,
                actions: <Widget>[
                    AnimatedBuilder(
                        animation: otherAnimation,
                        builder: (BuildContext context, Widget child) {
                            return Transform.scale(
                                scale: otherAnimation.value,
                                child: child,
                            );
                        },
                        child: IconButton(
                            onPressed: () {
                                setState(() {
                                    locale.lang = locale.lang == Language.en ? Language.tr : Language.en;
                                });
                            },
                            icon: Icon(Icons.translate),
                        ),
                    ),
                    AnimatedBuilder(
                        animation: otherAnimation,
                        builder: (BuildContext context, Widget child) {
                            return Transform.scale(
                                scale: otherAnimation.value,
                                child: child,
                            );
                        },
                        child: IconButton(
                            onPressed: () {
                                save.save(values.values);
                                setState(() {
                                    values = {
                                        'Match Number': Value<String>.withValue(''),
                                        'Color': Value<String>.withValue(''),
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
                    ),
                    AnimatedBuilder(
                        animation: otherAnimation,
                        builder: (BuildContext context, Widget child) {
                            return Transform.scale(
                                scale: otherAnimation.value,
                                child: child,
                            );
                        },
                        child: Builder(
                            builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                        save.getClipboard(context);
                                    }, icon: Icon(Icons.content_copy),
                                );
                            },
                        ),
                    ),
                    AnimatedBuilder(
                        animation: otherAnimation,
                        builder: (BuildContext context, Widget child) {
                            return Transform.scale(
                                scale: otherAnimation.value,
                                child: child,
                            );
                        },
                        child: Builder(
                            builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                        save.erase(context);
                                    }, icon: Icon(Icons.delete_forever),
                                );
                            },
                        ),
                    ),
                    IconButton(
                        icon: AnimatedIcon(
                            progress: controller,
                            icon: AnimatedIcons.menu_close,
                        ),
                        onPressed: () {
                            setState(() {
                                if (isOpen) {
                                    isOpen = false;
                                    controller.reverse();
                                    otherController.reverse();
                                }
                                else {
                                    isOpen = true;
                                    controller.forward();
                                    otherController.forward();
                                }
                            });
                        },
                    )
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
                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                        }
                                    });
                                },
                                child: ListView(
                                    children: <Widget>[
                                        TextInput(
                                            title: 'Match Number',
                                            value: values['Match Number'],
                                            multiline: false,
                                            onTap: () {
                                                setState(() {
                                                    selected = 'Match Number';
                                                    text = values[selected].value;
                                                });
                                            },
                                        ),
                                        SelectorInput(
                                            title: 'Color',
                                            value: values['Color'],
                                            choices: [
                                                '',
                                                'Red',
                                                'Blue',
                                            ],
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
                            decoration: BoxDecoration(
                                color: Theme
                                  .of(context)
                                  .primaryColorLight,
                                boxShadow: [
                                    BoxShadow(blurRadius: 12)
                                ],
                            ),
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
