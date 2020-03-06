import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/input.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class TextInput extends StatefulWidget implements Input {
    final String title;
    final bool multiline;
    final Value<String> value;
    
    const TextInput({Key key, this.title, this.multiline, this.value}) : super(key: key);
    
    @override
    _TextInputState createState() => _TextInputState();
    
    @override
    Map<String, dynamic> toJson() {
        return {title: value.value};
    }
}

class _TextInputState extends State<TextInput> {
    LocaleString locale = LocaleString();
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                TextField(
                    readOnly: true,
                    showCursor: true,
                    keyboardType: widget.multiline ? TextInputType.multiline : null,
                    onChanged: (value) {
                        widget.value.set(value);
                    },
                ),
            ],
        );
    }
}
