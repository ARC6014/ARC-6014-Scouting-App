import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';

String _value;


class SelectorInput extends StatefulWidget implements Input {
    final String title;
    final List<String> choices;
    
    SelectorInput({Key key, this.title, this.choices}) : super(key: key);
    
    @override
    _SelectorInputState createState() => _SelectorInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: _value};
    }
}


class _SelectorInputState extends State<SelectorInput> {
    LocaleString locale = LocaleString();
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                DropdownButton<String>(
                    isExpanded: true,
                    value: _value,
                    onChanged: (value) {
                        setState(() {
                            _value = value;
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
        );
    }
}
