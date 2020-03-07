import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class CheckboxInput extends StatefulWidget {
    final String title;
    final Value<bool> value;
    
    const CheckboxInput({Key key, this.title, this.value}) : super(key: key);
    
    @override
    _CheckboxInputState createState() => _CheckboxInputState();
    
}

class _CheckboxInputState extends State<CheckboxInput> {

    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                Text(locale.get(widget.title)),
                Checkbox(
                    onChanged: (bool value) {
                        setState(() {
                            widget.value.set(value);
                        });
                    },
                    value: widget.value.value,
                ),
            ],
        );
    }
}
