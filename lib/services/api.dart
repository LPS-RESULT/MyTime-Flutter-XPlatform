import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mytime_mobile/models/auth.dart';
import 'package:mytime_mobile/models/user.dart';
import 'package:mytime_mobile/services/prefs.dart';

const apiClientId = 'cHbOAAKDptMFnPnEWDOSWJwoVZuySMVXthFY'
    'XNHqnLLrxlFPRrdSSoDkWnrPOPeAlsAMHwNahaRQvhfFvQROE';
const apiSecret = '27037399992987747329';

Future<SfAuthResponse> loginWithSFToken({@required String username,
  @required String password, @required String securityCode}) async {
  String url = 'https://test.salesforce.com/services/oauth2/'
      'token?grant_type=password&client_id=$apiClientId&client_secret='
      '$apiSecret&username=$username&password=$password$securityCode';
  final response = await post(url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
  );
  return sfAuthResponseFromJson(response.body);
}

Future<UserProfile> getUserDetails() async {
  SfAuthResponse userDetails = await getAuthFromPrefs();
  String url = '${userDetails.instanceUrl}/services/data/'
  'v44.0/query/?q=SELECT+AboutMe%2CAccountId%2CAddress%2CAlias%2CBadgeText%2C'
  'BannerPhotoUrl%2CCallCenterId%2CCity%2CCommunityNickname%2CCompanyName%'
  '2CContactId%2CContact_Id__c%2CContact_Record__c%2CCountry%2CCreatedById%2C'
  'CreatedDate%2CDelegatedApproverId%2CDepartment%2CDigestFrequency%2CDivision'
  '%2CEmail%2CEmailEncodingKey%2CEmailPreferencesAutoBcc%2C'
  'EmailPreferencesAutoBccStayInTouch%2CEmailPreferencesStayInTouchReminder'
  '%2CEmployeeNumber%2CExtension%2CFax%2CFederationIdentifier%2CFirstName%'
  '2CForecastEnabled%2CFullPhotoUrl%2CGeocodeAccuracy%2CId%2CIsActive%2C'
  'IsExtIndicatorVisible%2CIsPortalEnabled%2CIsProfilePhotoActive%2C'
  'LanguageLocaleKey%2CLastLoginDate%2CLastModifiedById%2CLastModifiedDate%2C'
  'LastName%2CLastReferencedDate%2CLastViewedDate%2CLatitude%2CLocaleSidKey'
  '%2CLongitude%2CManagerId%2CMediumBannerPhotoUrl%2CMediumPhotoUrl%2C'
  'MiddleName%2CMobilePhone%2CName%2COfflinePdaTrialExpirationDate%2C'
  'OfflineTrialExpirationDate%2COutOfOfficeMessage%2CPhone%2CPortalRole%2C'
  'PostalCode%2CReceivesAdminInfoEmails%2CReceivesInfoEmails%2CSenderEmail%2C'
  'SenderName%2CSignature%2CSmallBannerPhotoUrl%2CSmallPhotoUrl%2CState%2C'
  'StayInTouchNote%2CStayInTouchSignature%2CStayInTouchSubject%2CStreet%2C'
  'Suffix%2CSystemModstamp%2CTimeZoneSidKey%2CTitle%2CUsername%2CUserRoleId%2C'
  'UserType+FROM+User+where+Email+%3D+%27${userDetails.username}%27';
  final response = await get(url,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${userDetails.accessToken}'
    },
  );
  return userProfileFromJson(response.body);
}

Future<UserProfile> getTimesheetForWeekEnd(String weekEndDate, {
  @required String userId
  }) async {
  SfAuthResponse userDetails = await getAuthFromPrefs();
  String url = '${userDetails.instanceUrl}/services/data/'
      'v44.0/query/?q=SELECT+AboutMe%2CAccountId%2CAddress%2CAlias%2CBadgeText%2C'
      'BannerPhotoUrl%2CCallCenterId%2CCity%2CCommunityNickname%2CCompanyName%'
      '2CContactId%2CContact_Id__c%2CContact_Record__c%2CCountry%2CCreatedById%2C'
      'CreatedDate%2CDelegatedApproverId%2CDepartment%2CDigestFrequency%2CDivision'
      '%2CEmail%2CEmailEncodingKey%2CEmailPreferencesAutoBcc%2C'
      'EmailPreferencesAutoBccStayInTouch%2CEmailPreferencesStayInTouchReminder'
      '%2CEmployeeNumber%2CExtension%2CFax%2CFederationIdentifier%2CFirstName%'
      '2CForecastEnabled%2CFullPhotoUrl%2CGeocodeAccuracy%2CId%2CIsActive%2C'
      'IsExtIndicatorVisible%2CIsPortalEnabled%2CIsProfilePhotoActive%2C'
      'LanguageLocaleKey%2CLastLoginDate%2CLastModifiedById%2CLastModifiedDate%2C'
      'LastName%2CLastReferencedDate%2CLastViewedDate%2CLatitude%2CLocaleSidKey'
      '%2CLongitude%2CManagerId%2CMediumBannerPhotoUrl%2CMediumPhotoUrl%2C'
      'MiddleName%2CMobilePhone%2CName%2COfflinePdaTrialExpirationDate%2C'
      'OfflineTrialExpirationDate%2COutOfOfficeMessage%2CPhone%2CPortalRole%2C'
      'PostalCode%2CReceivesAdminInfoEmails%2CReceivesInfoEmails%2CSenderEmail%2C'
      'SenderName%2CSignature%2CSmallBannerPhotoUrl%2CSmallPhotoUrl%2CState%2C'
      'StayInTouchNote%2CStayInTouchSignature%2CStayInTouchSubject%2CStreet%2C'
      'Suffix%2CSystemModstamp%2CTimeZoneSidKey%2CTitle%2CUsername%2CUserRoleId%2C'
      'UserType+FROM+User+where+Email+%3D+%27${userDetails.username}%27';
  final response = await get(url,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${userDetails.accessToken}'
    },
  );
  return userProfileFromJson(response.body);
}