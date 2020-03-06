import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class CounterInput extends StatefulWidget implements Input {
    final String title;
    final Value<int> value;
    
    const CounterInput({Key key, this.title, this.value}) : super(key: key);
    
    @override
    _CounterInputState createState() => _CounterInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: value.value};
    }
}

class _CounterInputState extends State<CounterInput> {
    LocaleString locale = LocaleString();

    @override
    void initState() {
        widget.value.set(0);
    }
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                Row(
                    children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () {
                                setState(() {
                                    widget.value.set(widget.value.value - 1);
                                });
                            },
                        ),
                        Text(widget.value.value.toString()),
                        IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () {
                                setState(() {
                                    widget.value.set(widget.value.value + 1);
                                });
                            },
                        ),
                    ],
                )
            ],
        );
    }
}
