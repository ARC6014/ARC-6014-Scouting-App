import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';

List<Duration> _values = [];

class StopwatchInput extends StatefulWidget implements Input {
    final String title;
    
    const StopwatchInput({Key key, this.title}) : super(key: key);
    
    @override
    _StopwatchInputState createState() => _StopwatchInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: _values.map((e) => e.toString()).toList()};
    }
}

class _StopwatchInputState extends State<StopwatchInput> {
    LocaleString locale = LocaleString();
    Stopwatch stopwatch = Stopwatch();
    
    List<String> text = ['Start the counter', 'End the counter'];
    int index = 0;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                FlatButton(
                    onPressed: () {
                        if (index == 0) {
                            index = 1;
                            stopwatch.start();
                        }
                        if (index == 1) {
                            index = 0;
                            stopwatch.stop();
                            _values.add(stopwatch.elapsed);
                            stopwatch.reset();
                        }
                    },
                    child: Text(locale.get(text[index])),
                ),
            ],
        );
    }
}
