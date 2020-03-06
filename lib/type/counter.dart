import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class CounterInput extends StatefulWidget {
    final String title;
    
    const CounterInput({Key key, this.title}) : super(key: key);
    
    @override
    _CounterInputState createState() => _CounterInputState();
}

class _CounterInputState extends State<CounterInput> {
    LocaleString locale = LocaleString();
    int value = 0;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                Row(
                    children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () {setState(() {--value;});},
                        ),
                        Text(value.toString()),
                        IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () {setState(() {++value;});},
                        ),
                    ],
                )
            ],
        );
    }
}
