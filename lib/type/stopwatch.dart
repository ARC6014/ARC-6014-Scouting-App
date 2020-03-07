import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/value.dart';


class StopwatchInput extends StatefulWidget {
    final String title;
    final Value<Duration> value;
    
    const StopwatchInput({Key key, this.title, this.value}) : super(key: key);
    
    @override
    _StopwatchInputState createState() => _StopwatchInputState();
    
}

class _StopwatchInputState extends State<StopwatchInput> {
    Stopwatch stopwatch = Stopwatch();
    
    List<String> text = ['Start the counter', 'End the counter', 'Disabled'];
    int index = 0;
    
    @override
    Widget build(BuildContext context) {
        if (widget.value.value == Duration() && index == 2) index = 0;
        return Card(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text(
                            locale.get(widget.title),
                            style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            color: Theme
                              .of(context)
                              .primaryColorLight,
                            elevation: 2,
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
                            child: Text(
                                locale.get(text[index]),
                                style: Theme
                                  .of(context)
                                  .textTheme
                                  .button,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
