import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class TextInput extends StatefulWidget {
    final String title;
    final bool multiline;
    
    const TextInput({Key key, this.title, this.multiline}) : super(key: key);
    
    @override
    _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
    LocaleString locale = LocaleString();
    TextEditingController controller = TextEditingController();

    get value => controller.value;
    
    @override
    void dispose() {
        controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                TextField(
                    readOnly: true,
                    showCursor: true,
                    controller: controller,
                    keyboardType: widget.multiline ? TextInputType.multiline : null,
                ),
            ],
        );
    }
}
