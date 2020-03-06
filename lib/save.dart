import 'package:connectivity/connectivity.dart';
import 'package:scouting_app_rewrite/type/value.dart';

class Save {
    void save(Iterable<Value> values) {
        Connectivity().checkConnectivity().then((value) {
            if (value == ConnectivityResult.mobile || value == ConnectivityResult.wifi)
                saveremote(values);
            else
                savelocal(values);
        });
    }
    
    void savelocal(Iterable<Value> values) {
    
    }
    
    void saveremote(Iterable<Value> values) {
    
    }
}