import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class TextInput extends StatefulWidget {
    final String title;
    final bool multiline;
    final Value<String> value;
    final VoidCallback onTap;
    
    
    const TextInput({Key key, this.title, this.multiline, this.value, this.onTap}) : super(key: key);
    
    @override
    _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
    TextEditingController controller = TextEditingController();
    
    @override
    Widget build(BuildContext context) {
        controller.text = widget.value.value;
        controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
        return Card(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                    children: <Widget>[
                        Text(locale.get(widget.title)),
                        TextField(
                            readOnly: true,
                            showCursor: true,
                            keyboardType: widget.multiline ? TextInputType.multiline : null,
                            onChanged: (value) {
                                widget.value.set(value);
                            },
                            onTap: widget.onTap,
                            controller: controller,
                        ),
                    ],
                ),
            ),
        );
    }
}
