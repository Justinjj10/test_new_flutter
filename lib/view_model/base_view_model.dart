// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../constants/enums.dart';
import 'package:connectivity/connectivity.dart';

class BaseModel extends ChangeNotifier {
  
  ViewState _state = ViewState.initial;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

   Future checkNetwork<Bool>() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }
}
