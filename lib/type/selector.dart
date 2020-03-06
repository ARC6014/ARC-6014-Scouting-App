import 'package:flutter/material.dart';
import 'package:scouting_app_rewrite/localization.dart';

class SelectorInput extends StatefulWidget {
    final String title;
    final List<String> choices;
    
    const SelectorInput({Key key, this.title, this.choices}) : super(key: key);
    
    @override
    _SelectorInputState createState() => _SelectorInputState();
}


class _SelectorInputState extends State<SelectorInput> {
    LocaleString locale = LocaleString();
    String value;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(locale.get(widget.title)),
                DropdownButton<String>(
                    isExpanded: true,
                    value: value,
                    onChanged: (value) {
                        setState(() {
                            this.value = value;
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
