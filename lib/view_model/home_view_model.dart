import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../services/Repository/home_repository.dart';
import '../locator.dart';
import '../Model/customer_model.dart';
import './base_view_model.dart';
import '../constants/enums.dart';

class HomeViewModel extends BaseModel {
  final HomeRepository _api = locator<HomeRepository>();

 Customer? customerer;

  Customer? get userName => customerer;

   set setCustomer(Customer cust) {
    customerer = cust;
    notifyListeners();
  }

  bool isLoaded = false;

    void setLoading(value) {
    isLoaded = value;
    notifyListeners();
  }

  Future getUsers(String text, page, bool isScroll) async {
  }

  Future getCusomer(String mobile) async {
    var check = await checkNetwork();
      if (check) {
        await _api.getCustomers(mobile).then((data) {
               if (data.statusCode == 200) {
            var parsed = CustomeDetails.fromJson(json.decode(data.body));
            setCustomer = parsed.response.customer;
            if (kDebugMode) {
              print(parsed.response.customer.firstName);
            }
           }
        });
      }
      setLoading(true);
  }
}