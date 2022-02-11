// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2661FA),
                fontSize: 36
              ),
              textAlign: TextAlign.left,
            ),
          ),

          SizedBox(height: size.height * 0.03),

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (phone) {
                  if (kDebugMode) {
                    print(phone.completeNumber);
                  }
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              )
          ),

          SizedBox(height: size.height * 0.03),

          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: loginButton
          ),
        ],
      ),
    );
  }
  Widget loginButton =  RawMaterialButton(
      fillColor: Colors.green,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'Proceed',
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
            Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    )
          ],
        ),
      ),
      onPressed: (){

      },
      shape: const StadiumBorder(),
    );
}

