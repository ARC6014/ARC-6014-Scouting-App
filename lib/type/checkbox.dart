import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class CheckboxInput extends StatefulWidget {
    final String title;
    
    const CheckboxInput({Key key, this.title}) : super(key: key);
    
    @override
    _CheckboxInputState createState() => _CheckboxInputState();
}

class _CheckboxInputState extends State<CheckboxInput> {
    LocaleString locale = LocaleString();
    bool value = false;
    
    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                Text(locale.get(widget.title)),
                Checkbox(
                    onChanged: (bool value) {setState(() {this.value = value;});},
                    value: value,
                ),
            ],
        );
    }
}
