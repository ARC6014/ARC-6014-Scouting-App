import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';

bool _value = false;

class CheckboxInput extends StatefulWidget implements Input {
    final String title;
    
    const CheckboxInput({Key key, this.title}) : super(key: key);
    
    @override
    _CheckboxInputState createState() => _CheckboxInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: _value};
    }
}

class _CheckboxInputState extends State<CheckboxInput> {
    LocaleString locale = LocaleString();
    
    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                Text(locale.get(widget.title)),
                Checkbox(
                    onChanged: (bool value) {
                        setState(() {
                            _value = value;
                        });
                    },
                    value: _value,
                ),
            ],
        );
    }
}
