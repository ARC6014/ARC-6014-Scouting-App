import 'package:flutter/material.dart';
import 'package:scouting_app/custom.dart';
import 'package:scouting_app/decoration.dart';
import 'package:scouting_app/file.dart';
import 'package:scouting_app/grid.dart';
import 'package:scouting_app/input.dart';
import 'package:scouting_app/labeled_widget.dart';
import 'package:scouting_app/localization.dart';
import 'package:scouting_app/name.dart';
import 'package:scouting_app/screen/main.dart';
import 'package:scouting_app/style.dart';


class InputScreen extends StatefulWidget {
    @override
    _InputScreenState createState() => _InputScreenState();
}

Input input = Input();

class _InputScreenState extends State<InputScreen> {
    
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'Input Screen'.lang(lang),
                    style: titleTextStyle(context),
                ),
            ),
            body: Container(
                decoration: scaffoldDecoration(context),
                child: ListView.builder(
                    itemCount: infiniterecharge2020.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                        input.stopwatches['Stopwatch'] ??= Stopwatch();
                        if (index == 0) {
                            String id = 'Stopwatch';
                            input.indexes[id] ??= 0;
                            input.stopwatches[id] ??= Stopwatch();
                            return Padding(
                                padding: EdgeInsets.all(16),
                                child: Card(
                                    child: Container(
                                        decoration: cardDecoration(context),
                                        child: ListTile(
                                            title: Text(
                                                [
                                                    'Start the counter'.lang(lang),
                                                    'End the counter'.lang(lang),
                                                ][input.indexes['Stopwatch'] % 2],
                                                style: mediumTextStyle(context),
                                            ),
                                            onTap: () {
                                                setState(() {
                                                    input.indexes[id]++;
                                                });
                                                if (input.indexes[id] == 1) {
                                                    input.stopwatches[id].start();
                                                }
                                                else if (input.indexes[id] == 2) {
                                                    setState(() {
                                                        input.stopwatches[id].stop();
                                                    });
                                                    writeInput(input);
                                                    setState(() {
                                                        input = Input();
                                                    });
                                                }
                                            },
                                        ),
                                    ),
                                ),
                            );
                        }
                        InputData data = infiniterecharge2020[index - 1];
                        Widget result = Placeholder(fallbackHeight: 30,);
                        
                        switch (data.type) {
                            case InputDataType.textBox:
                                result = LabeledWidget(
                                    text: Text(
                                        data.id.lang(lang),
                                        style: subTextStyle(context),
                                    ),
                                    child: TextField(
                                        style: textBoxTextStyle(context),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                            input.textBox.putIfAbsent(data.id, () => value);
                                            input.textBox[data.id] = value;
                                        },
                                    ),
                                );
                                break;
                            case InputDataType.colorSelector:
                                result = LabeledWidget(
                                    text: Text(
                                        data.id.lang(lang),
                                        style: subTextStyle(context),
                                    ),
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: input.colorSelector[data.id],
                                        onChanged: (value) {
                                            setState(() {
                                                input.colorSelector.putIfAbsent(data.id, () => value);
                                                input.colorSelector[data.id] = value;
                                            });
                                        },
                                        items: data.colorSelection.map<DropdownMenuItem<String>>((Color value) {
                                            return DropdownMenuItem<String>(
                                                value: value.name(),
                                                child: Text(
                                                    value.name().lang(lang),
                                                    style: smallTextStyle(context),
                                                ),
                                            );
                                        }).toList(),
                                    ),
                                );
                                break;
                            case InputDataType.textSelector:
                                result = LabeledWidget(
                                    text: Text(
                                        data.id.lang(lang),
                                        style: subTextStyle(context),
                                    ),
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: input.textSelector[data.id],
                                        onChanged: (value) {
                                            setState(() {
                                                input.textSelector.putIfAbsent(data.id, () => value);
                                                input.textSelector[data.id] = value;
                                            });
                                        },
                                        items: data.selection.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                    value.lang(lang),
                                                    style: smallTextStyle(context),
                                                ),
                                            );
                                        }).toList(),
                                    ),
                                );
                                break;
                            case InputDataType.oneUseStopwatch:
                                input.indexes[data.id] ??= 0;
                                input.stopwatches[data.id] ??= Stopwatch();
                                result = LabeledWidget(
                                    text: Text(
                                        data.id.lang(lang),
                                        style: subTextStyle(context),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                            RaisedButton(
                                                onPressed: input.indexes[data.id] < 2 ? () {
                                                    setState(() {
                                                        input.indexes[data.id]++;
                                                    });
                                                    if (input.indexes[data.id] == 1) {
                                                        input.stopwatches[data.id].start();
                                                    }
                                                    else if (input.indexes[data.id] == 2) {
                                                        setState(() {
                                                            input.stopwatches[data.id].stop();
                                                            input.oneUseStopwatch.putIfAbsent(
                                                              data.id, () => input.stopwatches[data.id].elapsed
                                                            );
                                                        });
                                                    }
                                                } : null,
                                            ),
                                            Text(
                                                data.selection[input.indexes[data.id]]
                                                  .lang(lang)
                                                  .replaceFirst('%counter', input.stopwatches[data.id].elapsed.toString()),
                                                style: smallTextStyle(context),
                                            ),
                                        ],
                                    ),
                                );
                                break;
                            case InputDataType.gridButton:
                                input.indexes[data.id] ??= 0;
                                input.stopwatches[data.id] ??= Stopwatch();
                                input.gridButton[data.id] ??= List<String>();
                                input.gridButtonDuration[data.id] ??= List<Duration>();
                                input.gridButtonStart[data.id] ??= List<Duration>();
                                input.gridButtonEnd[data.id] ??= List<Duration>();
                                result = LabeledWidget(
                                    text: Text(
                                        data.id.lang(lang),
                                        style: subTextStyle(context),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                            RaisedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        input.indexes[data.id]++;
                                                    });
                                                    if (input.indexes[data.id] % 2 == 1) {
                                                        input.stopwatches[data.id].start();
                                                    }
                                                    else if (input.indexes[data.id] % 2 == 0) {
                                                        setState(() {
                                                            gridMenu(context, data, input);
                                                            
                                                            input.stopwatches[data.id].stop();
                                                            input.gridButtonDuration[data.id].add(
                                                                input.stopwatches[data.id].elapsed,
                                                            );
                                                            input.gridButtonStart[data.id].add(
                                                                input.stopwatches['Stopwatch'].elapsed,
                                                            );
                                                            input.gridButtonEnd[data.id].add(
                                                                input.stopwatches[data.id].elapsed +
                                                                  input.stopwatches['Stopwatch'].elapsed,
                                                            );
                                                        });
                                                    }
                                                },
                                            ),
                                            Text(
                                                data.selection[input.indexes[data.id] % 2].lang(lang),
                                                style: smallTextStyle(context),
                                            ),
                                        ],
                                    ),
                                );
                                break;
                            case InputDataType.checkbox:
                                result = Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CheckboxListTile(
                                        title: Text(
                                            data.id.lang(lang),
                                            style: subTextStyle(context),
                                        ),
                                        value: input.checkbox[data.id] ?? false,
                                        onChanged: (bool value) {
                                            setState(() {
                                                input.checkbox[data.id] = value;
                                            });
                                        },
                                    ),
                                );
                                break;
                            case InputDataType.counter:
                                result = Padding(
                                    padding: EdgeInsets.all(16),
                                    child: LabeledWidget(
                                        text: Text(
                                            data.id.lang(lang),
                                            style: subTextStyle(context),
                                        ),
                                        child: FlatButton(
                                            shape: CircleBorder(),
                                            color: Theme
                                              .of(context)
                                              .primaryColorLight,
                                            child: Padding(
                                                padding:  EdgeInsets.all(16),
                                                child: Text(
                                                    input.counter[data.id] == null ? '0' : input.counter[data.id].toString(),
                                                    style: largeTextStyle(context),
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    input.counter[data.id] ??= 0;
                                                    ++input.counter[data.id];
                                                });
                                            },
                                        
                                        ),
                                    ),
                                );
                                break;
                        }
                        return result;
                    },
                ),
            ),
        );
    }
}
