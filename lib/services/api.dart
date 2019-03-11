import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:mytime_mobile/models/auth.dart';
import 'dart:io';

const apiClientId = 'cHbOAAKDptMFnPnEWDOSWJwoVZuySMVXthFY'
    'XNHqnLLrxlFPRrdSSoDkWnrPOPeAlsAMHwNahaRQvhfFvQROE';
const apiSecret = '27037399992987747329';

Future<SfAuthResponse> loginWithSFToken({@required String username,
  @required String password, @required String securityCode}) async {
  String url = 'https://test.salesforce.com/services/oauth2/'
      'token?grant_type=password&client_id=$apiClientId&client_secret='
      '$apiSecret&username=$username&password=$password$securityCode';
  print(url);
  final response = await post(url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
  );
  print(response.body);
  return sfAuthResponseFromJson(response.body);
}