import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/type/checkbox.dart';
import 'package:scouting_app_rewrite/type/counter.dart';
import 'package:scouting_app_rewrite/type/selector.dart';
import 'package:scouting_app_rewrite/type/stopwatch.dart';
import 'package:scouting_app_rewrite/type/text.dart';

import 'type/value.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.pink,
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
    Map<String, Value> values = {
        'Stopwatch': Value<Duration>(),
        'Team Number': Value<String>(),
        'Ball Count of Lower Hole / Teleop': Value<int>(),
        'Ball Count of Upper Hole / Teleop': Value<int>(),
        'Ball Count of Small Hole / Teleop': Value<int>(),
        'Ball Count of Lower Hole / Autonomous': Value<int>(),
        'Ball Count of Upper Hole / Autonomous': Value<int>(),
        'Ball Count of Small Hole / Autonomous': Value<int>(),
        'Staying in Balance': Value<bool>(),
        'Can Adjust Balance': Value<bool>(),
        'Moved Away From Line': Value<bool>(),
        'Did Trench Run': Value<bool>(),
        'Bar Climb Time': Value<Duration>(),
        'Control Panel': Value<String>(),
        'Notes': Value<String>(),
    };
    
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                actions: <Widget>[
                    IconButton(
                        onPressed: () {
                            print(values['Ball Count of Lower Hole / Teleop'].value);
                        }, icon: Icon(Icons.print),
                    )
                ],
            ),
            body: Center(
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
                                'None',
                                '3 lap',
                                '3 lap with precise alignment'
                            ],
                        ),
                        TextInput(
                            title: 'Notes',
                            value: values['Notes'],
                            multiline: true,
                        ),
                    ],
                ),
            ),
        );
    }
}
