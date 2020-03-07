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

    
    @override
    Widget build(BuildContext context) {
        if (widget.value.value == Duration() && widget.value.extra == 2) widget.value.extra = 0;
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
                            onPressed: widget.value.extra < 2 ? () {
                                setState(() {
                                    if (widget.value.extra == 0) {
                                        stopwatch.start();
                                    }
                                    else if (widget.value.extra == 1) {
                                        stopwatch.stop();
                                        widget.value.set(stopwatch.elapsed);
                                        stopwatch.reset();
                                    }
                                    ++widget.value.extra;
                                });
                            } : null,
                            child: Text(
                                locale.get(text[widget.value.extra]),
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
