import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/export.dart';


import 'dart:math';
import 'package:convert/convert.dart';
/// The service responsible for networking requests
class HomeRepository {
  final Map<String, String> _githubTextMatchHeader = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>'
  };

  

  Future<String?> deviceId()  async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceIdentifier;
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      String? userAgent = webInfo.userAgent.toString();
      deviceIdentifier = webInfo.vendor! + userAgent + webInfo.hardwareConcurrency.toString(); 
    } else {
      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
         deviceIdentifier = iosInfo.identifierForVendor;
      } else {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
         deviceIdentifier = androidInfo.androidId;
      }
    }
    return deviceIdentifier;
  }

Future<String> hmacToken() async {
  var date =   DateTime.now().millisecondsSinceEpoch;
  print(date);
  var delimiter = 'zw1wyq';
  String? device = await deviceId();
  String uniqueString = '123123123123' + delimiter + '$date' + delimiter + '4620F7AF-171B-47F3-A58A-2982EA57A6EE';
  
  print(device);

  print(uniqueString);

   String? result = Cryptom().text(uniqueString);//text('123123123123zw1wyq1644380664000zw1wyq4620F7AF-171B-47F3-A58A-2982EA57A6EE');
      print(result);
  return result;
}

String hmac() {
    hmacToken().then((value) {
      return value;
    });
    return '';
}

  //static const String _baseUrl = 'getCustomer.json?';

  var client = http.Client();

  Future<http.Response> getCustomers(String mobile) async {
    var client = http.Client();
    String? token = await hmacToken();
    var v3Token = Cryptom().v3Token();
    String beareer = 'Bearer $v3Token';
    try {
         var response = await client.post(Uri.parse(Constants.BASE_URL +
          "v3/getCustomer.json?" +
          "&cust_mobile_no=$mobile" +
          "&is_full=y"),headers: {'token':token,'Authorization':beareer});

      if (kDebugMode) {
        print(response.body);
      }
    
      return response;
    } 
    finally {
      client.close();
    }
  }
}


class Cryptom {
  /// String Public Key
  String publickey =
      'MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmqpAIrg/E1Y5fp1t1bR1WDOFwQS8835BcC2/m/b65mhRjVouBp7Mj1H9eAHgm6GlnNQFWw4a9Y2MGhT51P+2qYMc8uf5Ln7ZFKm6mDcaYH48z7x4DjnWrn/i/C/bj0qfqp2Pgizaxyk0mEk+h7iHRC4I7w9Teb6bzxBZ2so/VtqyL7UVSEuXEsz1f+DwZTs+j7PJWTqdxfVvBMs6iBP8Hh/FJgkpKI7ixbf44BTO0AlHO8vpC6F2pJc/LS4/nszSeVDX3nT9xJjkrh0kn4ggaOo8B375j+RwZVVwrUkpveFO/VAsDvMykCDm+uVP1GfW+S87K6BRVvOP/Q24NmVd9TQZRrZHQeqXKQeYVINOT4f5gbIzdP1zcHZIaCDqGObHflaQP4yDkKJXBoqTgW8y9zMwyobjdGQKglBOhPEODoQIxuUz5EFi6nhsXaVfytugkXj0ighiQA3Gu0zPFsoQuZRQ9M+9Ytxovu3xIM+46wPwvFxX/DaTarLzDKAidWPeKrrGWUgPqyNBvut0ct8UIDBsowReXvBknYP/9lFb6sMDum/Gc1poHXEEtEPutJrlyEwai3ORr/nMbPuLqb4EoKWNNFVhgxmrqi5WR8s0i8eD98oCTLK06HX+DJn9GhBVmTNRnI9WrnwR8cOzku2tqCCZ9l3uMJtyQFIvA6bvszUCAwEAAQ==';
  String encrypt(String plaintext) {
    var bytes = base64Url.decode(publickey);

    /// After a lot of research on how to convert the public key [String] to [RSA PUBLIC KEY]
    /// We would have to use PEM Cert Type and the convert it from a PEM to an RSA PUBLIC KEY through basic_utils
    var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publickey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromDERBytes(bytes);//rsaPublicKeyFromPem(pem);

    /// Initalizing Cipher
    //var cipher = RSAEngine();

    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));

    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output =
        cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64Encode(output);


    

    return base64EncodedText;
  }  

 String encryptStr(String plainText) {
  var bytes = base64Url.decode(publickey);

    /// After a lot of research on how to convert the public key [String] to [RSA PUBLIC KEY]
    /// We would have to use PEM Cert Type and the convert it from a PEM to an RSA PUBLIC KEY through basic_utils
    var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publickey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);
AsymmetricKeyParameter<RSAPublicKey> keyParametersPublic =
PublicKeyParameter(public);

var cipher = RSAEngine()..init(true, keyParametersPublic);

var cipherText =
cipher.process(Uint8List.fromList(plainText.codeUnits));

return base64.encode(cipherText);
}

  String decryptKey() {
    return '';
  }

  String text(String text) {
    //return encrypt(text, publickey);
    return encrypt(text);
  }

String v3Token() {
  int validTime = 1644313193;
  var date =  DateTime.now().millisecondsSinceEpoch;
  String token = 'eyJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIiLCJkYXRhIjoiUEErRFxcZEtWIiwiZXhwIjoxNjQ0NjAzMTI3fQ.CN-jY4AljOgC-OyAX5-Z2s7u9MFdLeajbf-dvqPLEoG6Ecdw4NnKgdVKG4bP_UQ0c_2KNwWJ8-Oq4oX7Gb-D0Tlx24UmIEWjHC6esgGRAXaKLtmSbaVI7le2L0SE7GFVru5K3MWXp25bvrDJbf5JXgr4gt-56hhfGhy6cKWKXQXTmVDgb_4fTMFhrYB5DVh-xAbD2htjR_Z9jbPgGbjwuUiJUmDDIcq4kyFq6PHAN_rUJzZBjoUAB5jBaGO-6YCtR1eov-ihfE5tg_cAVwpoEs9l01vnSksdy-d2d4BpV2cTEVf3L_GsSwJdi6Yv7yLrFki8bKOru2lrOoX9L8L_wCFRNIe-9CHm3c2Gxvp9SKmqQD13nW2hHhf3c9ck2xvOrbwglXjelMVNoorWLcC5bQB9gguW3L1Zo8lVbjTbAdvF6NL9ncxFqr2H7hlcvQs3npNAkhWwZH6HenBI9608zvfuVUzR4_2qOuFa97bm3vmIoW9qRWAhWXULV11OwoEFRopPRjDRmyg866Pvh8ZCQ3t21SFXvVdchYUCukjANsrnxxMcw5H4pMryAKRkH6WBeBkavlHXHVkcu5iV1mTpHkAgH7SvhfGh0ONfeKXSoFyWBBlqRXtqUTI5cmAWSaN_gCZ91v78OtrI7xIvK3O84dgxP1EtG__SDEOX3bQ0Jdg';
    return token;
  }
  


}


class Constants {
  static const  String BASE_URL = "https://sougatabasu.com/cashrich/";
  static const String API_UNAME="user@sm0Ke";
  static const String API_PWD="sm0k3P@ss2022";

}