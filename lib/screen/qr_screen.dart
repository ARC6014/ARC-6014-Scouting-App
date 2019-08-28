import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/localization.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class QRScreen extends StatefulWidget {
    
    final List<String> history;
    
    const QRScreen({Key key, this.history}) : super(key: key);
    
    @override
    _QRScreen createState() => _QRScreen(this.history);
}

class _QRScreen extends State<QRScreen> {
    String qrData = "";
    int _index;
    final List<String> history;
    
    _QRScreen(this.history);
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: CustomLabel(AppLocalization.title),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                            setState(() {
                                history.removeAt(_index);
                            });
                        }
                    )
                ],
            ),
            body: ListView.builder(
                itemCount: history.length + 1,
                itemBuilder: (context, index) {
                    index--;
                    return index >= 0 ?
                    new CustomButton(
                        child: CustomLabel(
                            "Team " + history[index].split(",")[0],
                            style: TextStyle(
                                fontSize: 28.0,
                            ),
                        ),
                        onPressed: () {
                            setState(() {
                                _index = index;
                                qrData = history[index];
                            });
                        },
                    ) :
                    QrImage(
                        version: 10,
                        data: qrData,
                        size: MediaQuery.of(context).size.width,
                    );
                },
            ),
        );
    }
    
}

