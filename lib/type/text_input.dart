import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class TextInput extends StatefulWidget {
    final String title;
    
    const TextInput({Key key, this.title}) : super(key: key);
    
    @override
    _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
    LocaleString locale = LocaleString();
    TextEditingController controller = TextEditingController();


    @override
    void dispose() {
        controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(
                    locale.get(widget.title),
                ),
                TextField(
                    keyboardType: TextInputType.text,
                    controller: controller,
                ),
            ],
        );
    }
}
