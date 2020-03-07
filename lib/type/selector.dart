import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/value.dart';


class SelectorInput extends StatefulWidget {
    final String title;
    final List<String> choices;
    final Value<String> value;
    
    SelectorInput({Key key, this.title, this.choices, this.value}) : super(key: key);
    
    @override
    _SelectorInputState createState() => _SelectorInputState();
}


class _SelectorInputState extends State<SelectorInput> {
    
    @override
    Widget build(BuildContext context) {
        return Card(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                    children: <Widget>[
                        Text(locale.get(widget.title)),
                        DropdownButton<String>(
                            isExpanded: true,
                            value: widget.value.value,
                            onChanged: (value) {
                                setState(() {
                                    widget.value.set(value);
                                });
                            },
                            items: widget.choices.map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(locale.get(value)),
                                );
                            }).toList(),
                        ),
                    ],
                ),
            ),
        );
    }
}
