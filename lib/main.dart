import 'package:flutter/material.dart';

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
    Map values = {
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
            ),
            body: Column(
                children: <Widget>[
                    St
                ],
            ),
        );
    }
}
