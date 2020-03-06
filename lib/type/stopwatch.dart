import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';
import 'package:scouting_app_rewrite/type/value.dart';


class StopwatchInput extends StatefulWidget implements Input {
    final String title;
    final Values<Duration> values;
    
    const StopwatchInput({Key key, this.title, this.values}) : super(key: key);
    
    @override
    _StopwatchInputState createState() => _StopwatchInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: values.values.map((e) => e.toString()).toList()};
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
                            widget.values.add(stopwatch.elapsed);
                            stopwatch.reset();
                        }
                    },
                    child: Text(locale.get(text[index])),
                ),
            ],
        );
    }
}
