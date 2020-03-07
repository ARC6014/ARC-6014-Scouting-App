import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_app_rewrite/type/value.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;


/*class Save {
    Map cred = {
        "type": "service_account",
        "project_id": "scouting-app-270315",
        "private_key_id": "9cac69898895aea8a47e5a771636a6939460b05c",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDULqFUNcdistAY\nSJWjgM4Bv0BMHk0A/v9gxFNwyLrmhwF6shVtMSgZsACVJ8Hfi1oUJ7M23EceWN7I\nco4TjBk+vPVi0ROmMHQFEGzJdIZ01kMXn9MCPA+ppbeH/2VhIQY2BBk8aFzMESJi\nLRVbczV/tav0Qq2AShIOryAtMkfy7vPrEioRNr7qiVk9I1xsKJg/7vy5u508Cr2/\nTMs4pHwcstw3aVqZoi2qbVgUMy7tGL4TlFF/QbmBxNp3VBr/d5mdbA/X1xTYnGbU\nIyyQRJfjNd2i6Rh0qc35N3PAUatHeYf466HVFmA8p3jn6nI70wR20/wX4lWM0d1F\neDnyhS8NAgMBAAECggEAE+eb8s5oufWUV/LXNtNqf/d1DK77AlDpnCZOvZHXFrEr\njlsOb4PhAyfjphposZPdC279/POFKG+l1qAIfAT0iVIoovCCK2D4QVFdIzjvNB61\nhI3VuavwvDVzlip7VDVI4+BWjbgsnGgvFY6tJjsUlbpxOyTWKebI8t+y4QqKfVuJ\nWTK8I/GCUiB9Rj5wUwobL9bWLb1M1t4SVDVsHML4BGd/ONZ0f8QCUfwTTgobEGfO\n9xjxkEGRxQVGyEEbEd4pbmhLYNbKxX8tRAjLCzTyypNjPj0gVAa1lNhaBGbV17DA\n829wORP+o9l40DKuRErwGPTWv/NyBKgFEPWBpuBI8QKBgQD+WWVI/wwgmoU71X98\n0EX3jLnw0ar3rnAHJbWWdql0o+/Ggzak6R+qjsUVOuZvsSerP6pzidXdylxjxR80\nGOcwlWFJKLHf9DUzeE/AwehUsjWLqkGdD0TBw5PRoPiqzsmgTX77jyOKGOcISerE\nLrtR0ut3WiVZ6vBZZ+DtfiDqZwKBgQDVjyxoNGimfTPxJzGslJ8+2W5s0cSWuPRw\nN6ouK8iHlMOZmqUUXmAdQghPwJcnD9nIFrUKYTh5VtgQ3YQ2OaAYj2HPzDPhRJe4\neLikxN3tmaz3IRzMdkHWQ2IOhT7s4QLTAi9ezFodRDnVULye7+UMQMRjOuYKc6jQ\nRmpiwe1aawKBgQC18fr7Qb9KH18Jk0sUXOSAFgH5G/MiJH1tD3Obg5zqnE7sgXZ4\nd284kdK3wh+PbHnFDdD/v2zmsFhw4lTU7q+K2ID0VZEQdGAORpU+fTeWRrj5BLzU\n/lQgC6jVP0JC5ZPkASvCBf3VTsUN79pppkhHWwsnoKuxa9etDRsgqKYhJwKBgHvE\ntHnYFeaXnWjfzDw3DmvAW+0ZTZQEsTXwLOMBYQCiyRHWvGGnqJCMWoDOH0v2NcNu\n1ZGkcrRwDl0H5L4Ae7aAMrHZqR+fP0ccP/bOWciATewT9rrQtqtU9hlwQ93JMnfU\nRlvslzVq+xGT7x0170tAphDUa8oW6fl7NeDyf3rtAoGBANND4H7TZHWYtk/GIXO5\n5TXXzU/QmoeIdt5nzWSeRIF8U6IV8ANNpJSk69ppKZF937fdfGS6XpzgTm1u7m0e\nvu9NrWTaP/8UORprwYRfZBV/dTPJ3PCO4UFES5pKvPy0qdGKcv1sN9Uzmyxzl/BA\nQJmkWWsXaXTvvuRwFhhOX9yF\n-----END PRIVATE KEY-----\n",
        "client_email": "service-account@scouting-app-270315.iam.gserviceaccount.com",
        "client_id": "115426989748479203288",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/service-account%40scouting-app-270315.iam.gserviceaccount.com"
    };
    
    Save() {
        /*Connectivity().checkConnectivity().then((value) {
            if (value == ConnectivityResult.mobile || value == ConnectivityResult.wifi) {
                window.localStorage['data'].split('\t').forEach((element) {
                    saveremote(element.split(','));
                });
            }
        });*/
        
    }
    
    void save(Iterable<Value> values) {
        saveremote(values.map((e) => e.value));
        /*print("000");
        Connectivity().checkConnectivity().then((value) {
            print("001");
            if (value == ConnectivityResult.mobile || value == ConnectivityResult.wifi)
                saveremote(values.map((e) => e.value));
            else
                savelocal(values.map((e) => e.value));
        });*/
    }
    
    void savelocal(Iterable<String> values) {
        print("111");
        if (window.localStorage['data'] == null)
            window.localStorage['data'] = values.join(',');
        else
            window.localStorage['data'] += '\t' + values.join(',');
    }
    
    void prompt(String url) {
        print("Please go to the following URL and grant access:");
        print("  => $url");
        print("");
    }
    
    void saveremote(Iterable<String> values) {
        print("222");
        int index;
        var id = new ClientId("1091980037369-ga3omelvj9qiici6hto35831g81h0onn.apps.googleusercontent.com", "w7bsuIhmoWGwtxBtHdRqU7D1");
        var scopes = ['https://www.googleapis.com/auth/spreadsheets'];
        createImplicitBrowserFlow(id, scopes).then((BrowserOAuth2Flow flow) {
            print('sadf');
            var aaa = flow.clientViaUserConsent();
            print('asd');
            aaa.then((AuthClient client) {
                print('a');
                SheetsApi api = SheetsApi(client);
                print('b');
                api.spreadsheets.values.get('1Jf0Qyf2MZBbWkOY1LUYeUWntoJFfvVvApkLiqOZiEw4', 'A1:A1').then((value) {
                    index = value.values[0][0];
                    print(index);
                    api.spreadsheets.values.append(ValueRange.fromJson({
                        "values": [values.toList()]
                    }), '1Jf0Qyf2MZBbWkOY1LUYeUWntoJFfvVvApkLiqOZiEw4', 'B$index:P$index');
                },
                  onError: (e) {
                      print(e);
                  });
                client.close();
                flow.close();
            },
              onError: (e) {
                  print(e);
              });
        });
    }
    
}*/

class Save {
    
    Save() {
        html.window.localStorage['data'] ??= '';
    }
    
    void save(Iterable<Value> values) {
        if (html.window.localStorage['data'] == '')
            html.window.localStorage['data'] = values.map((e) {
                if (e.value is String && e.value.toString().contains('\n')) return '"' + e.value + '"';
                return e.value;
            }).join('\t');
        else
            html.window.localStorage['data'] += '\n' + values.map((e) {
                if (e.value is String && e.value.toString().contains('\n')) return '"' + e.value + '"';
                return e.value;
            }).join('\t');
    }
    
    void getClipboard(BuildContext context) {
        Clipboard.setData(ClipboardData(text: html.window.localStorage['data']));
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Copied data to clipboard"),
        ));
    }
    
    void erase(BuildContext context) {
        String temp = html.window.localStorage['data'];
        html.window.localStorage['data'] = '';
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 6),
            content: Text("Erased all data stored"),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                    html.window.localStorage['data'] = temp;
                },
            ),
        ));
    }
}