import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';
import 'package:scouting_app_rewrite/type/value.dart';


class StopwatchInput extends StatefulWidget implements Input {
    final String title;
    final Value<Duration> value;
    
    const StopwatchInput({Key key, this.title, this.value}) : super(key: key);
    
    @override
    _StopwatchInputState createState() => _StopwatchInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: value.value.toString()};
    }
}

class _StopwatchInputState extends State<StopwatchInput> {
    LocaleString locale = LocaleString();
    Stopwatch stopwatch = Stopwatch();
    
    List<String> text = ['Start the counter', 'End the counter', 'Disabled'];
    int index = 0;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                FlatButton(
                    onPressed: index < 2 ? () {
                        setState(() {
                            if (index == 0) {
                                index = 1;
                                stopwatch.start();
                            }
                            else if (index == 1) {
                                stopwatch.stop();
                                widget.value.set(stopwatch.elapsed);
                                stopwatch.reset();
                                index = 2;
                            }
                        });
                    } : null,
                    child: Text(locale.get(text[index])),
                ),
            ],
        );
    }
}
