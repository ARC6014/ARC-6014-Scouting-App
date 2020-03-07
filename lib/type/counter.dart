import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class CounterInput extends StatefulWidget {
    final String title;
    final Value<int> value;
    
    const CounterInput({Key key, this.title, this.value}) : super(key: key);
    
    @override
    _CounterInputState createState() => _CounterInputState();
    
}

class _CounterInputState extends State<CounterInput> {
    
    
    @override
    Widget build(BuildContext context) {
        return Card(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
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
                ),
            ),
        );
    }
}
