import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class StopwatchInput extends StatefulWidget {
    final String title;
    
    const StopwatchInput({Key key, this.title}) : super(key: key);
    
    @override
    _StopwatchInputState createState() => _StopwatchInputState();
}

class _StopwatchInputState extends State<StopwatchInput> {
    LocaleString locale = LocaleString();
    List<Duration> values = [];
    Stopwatch stopwatch = Stopwatch();
    
    List<String> text = ['Start the counter', 'End the counter'];
    int index = 0;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                FlatButton(
                    onPressed: () {setState(() {index = ++index % 2;});},
                    child: Text(locale.get(text[index])),
                ),
            ],
        );
    }
}
