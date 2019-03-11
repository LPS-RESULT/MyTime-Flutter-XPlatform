import 'dart:convert';

UserProfile userProfileFromJson(String str) {
  final jsonData = json.decode(str);
  return UserProfile.fromJson(jsonData["records"][0]);
}

String userProfileToJson(UserProfile data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserProfile {
  Attributes attributes;
  String aboutMe;
  String accountId;
  String address;
  String alias;
  String badgeText;
  String bannerPhotoUrl;
  String callCenterId;
  String city;
  String communityNickname;
  String companyName;
  String contactId;
  String contactIdC;
  String contactRecordC;
  String country;
  String createdById;
  String createdDate;
  String delegatedApproverId;
  String department;
  String digestFrequency;
  String division;
  String email;
  String emailEncodingKey;
  bool emailPreferencesAutoBcc;
  bool emailPreferencesAutoBccStayInTouch;
  bool emailPreferencesStayInTouchReminder;
  String employeeNumber;
  String extension;
  String fax;
  String federationIdentifier;
  String firstName;
  bool forecastEnabled;
  String fullPhotoUrl;
  String geocodeAccuracy;
  String id;
  bool isActive;
  bool isExtIndicatorVisible;
  bool isPortalEnabled;
  bool isProfilePhotoActive;
  String languageLocaleKey;
  String lastLoginDate;
  String lastModifiedById;
  String lastModifiedDate;
  String lastName;
  String lastReferencedDate;
  String lastViewedDate;
  String latitude;
  String localeSidKey;
  String longitude;
  String managerId;
  String mediumBannerPhotoUrl;
  String mediumPhotoUrl;
  String middleName;
  String mobilePhone;
  String name;
  String offlinePdaTrialExpirationDate;
  String offlineTrialExpirationDate;
  String outOfOfficeMessage;
  String phone;
  String portalRole;
  String postalCode;
  bool receivesAdminInfoEmails;
  bool receivesInfoEmails;
  String senderEmail;
  String senderName;
  String signature;
  String smallBannerPhotoUrl;
  String smallPhotoUrl;
  String state;
  String stayInTouchNote;
  String stayInTouchSignature;
  String stayInTouchSubject;
  String street;
  String suffix;
  String systemModstamp;
  String timeZoneSidKey;
  String title;
  String username;
  String userRoleId;
  String userType;

  UserProfile({
    this.attributes,
    this.aboutMe,
    this.accountId,
    this.address,
    this.alias,
    this.badgeText,
    this.bannerPhotoUrl,
    this.callCenterId,
    this.city,
    this.communityNickname,
    this.companyName,
    this.contactId,
    this.contactIdC,
    this.contactRecordC,
    this.country,
    this.createdById,
    this.createdDate,
    this.delegatedApproverId,
    this.department,
    this.digestFrequency,
    this.division,
    this.email,
    this.emailEncodingKey,
    this.emailPreferencesAutoBcc,
    this.emailPreferencesAutoBccStayInTouch,
    this.emailPreferencesStayInTouchReminder,
    this.employeeNumber,
    this.extension,
    this.fax,
    this.federationIdentifier,
    this.firstName,
    this.forecastEnabled,
    this.fullPhotoUrl,
    this.geocodeAccuracy,
    this.id,
    this.isActive,
    this.isExtIndicatorVisible,
    this.isPortalEnabled,
    this.isProfilePhotoActive,
    this.languageLocaleKey,
    this.lastLoginDate,
    this.lastModifiedById,
    this.lastModifiedDate,
    this.lastName,
    this.lastReferencedDate,
    this.lastViewedDate,
    this.latitude,
    this.localeSidKey,
    this.longitude,
    this.managerId,
    this.mediumBannerPhotoUrl,
    this.mediumPhotoUrl,
    this.middleName,
    this.mobilePhone,
    this.name,
    this.offlinePdaTrialExpirationDate,
    this.offlineTrialExpirationDate,
    this.outOfOfficeMessage,
    this.phone,
    this.portalRole,
    this.postalCode,
    this.receivesAdminInfoEmails,
    this.receivesInfoEmails,
    this.senderEmail,
    this.senderName,
    this.signature,
    this.smallBannerPhotoUrl,
    this.smallPhotoUrl,
    this.state,
    this.stayInTouchNote,
    this.stayInTouchSignature,
    this.stayInTouchSubject,
    this.street,
    this.suffix,
    this.systemModstamp,
    this.timeZoneSidKey,
    this.title,
    this.username,
    this.userRoleId,
    this.userType,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => new UserProfile(
    attributes: Attributes.fromJson(json["attributes"]),
    aboutMe: json["AboutMe"],
    accountId: json["AccountId"],
    address: json["Address"],
    alias: json["Alias"],
    badgeText: json["BadgeText"],
    bannerPhotoUrl: json["BannerPhotoUrl"],
    callCenterId: json["CallCenterId"],
    city: json["City"],
    communityNickname: json["CommunityNickname"],
    companyName: json["CompanyName"],
    contactId: json["ContactId"],
    contactIdC: json["Contact_Id__c"],
    contactRecordC: json["Contact_Record__c"],
    country: json["Country"],
    createdById: json["CreatedById"],
    createdDate: json["CreatedDate"],
    delegatedApproverId: json["DelegatedApproverId"],
    department: json["Department"],
    digestFrequency: json["DigestFrequency"],
    division: json["Division"],
    email: json["Email"],
    emailEncodingKey: json["EmailEncodingKey"],
    emailPreferencesAutoBcc: json["EmailPreferencesAutoBcc"],
    emailPreferencesAutoBccStayInTouch: json["EmailPreferencesAutoBccStayInTouch"],
    emailPreferencesStayInTouchReminder: json["EmailPreferencesStayInTouchReminder"],
    employeeNumber: json["EmployeeNumber"],
    extension: json["Extension"],
    fax: json["Fax"],
    federationIdentifier: json["FederationIdentifier"],
    firstName: json["FirstName"],
    forecastEnabled: json["ForecastEnabled"],
    fullPhotoUrl: json["FullPhotoUrl"],
    geocodeAccuracy: json["GeocodeAccuracy"],
    id: json["Id"],
    isActive: json["IsActive"],
    isExtIndicatorVisible: json["IsExtIndicatorVisible"],
    isPortalEnabled: json["IsPortalEnabled"],
    isProfilePhotoActive: json["IsProfilePhotoActive"],
    languageLocaleKey: json["LanguageLocaleKey"],
    lastLoginDate: json["LastLoginDate"],
    lastModifiedById: json["LastModifiedById"],
    lastModifiedDate: json["LastModifiedDate"],
    lastName: json["LastName"],
    lastReferencedDate: json["LastReferencedDate"],
    lastViewedDate: json["LastViewedDate"],
    latitude: json["Latitude"],
    localeSidKey: json["LocaleSidKey"],
    longitude: json["Longitude"],
    managerId: json["ManagerId"],
    mediumBannerPhotoUrl: json["MediumBannerPhotoUrl"],
    mediumPhotoUrl: json["MediumPhotoUrl"],
    middleName: json["MiddleName"],
    mobilePhone: json["MobilePhone"],
    name: json["Name"],
    offlinePdaTrialExpirationDate: json["OfflinePdaTrialExpirationDate"],
    offlineTrialExpirationDate: json["OfflineTrialExpirationDate"],
    outOfOfficeMessage: json["OutOfOfficeMessage"],
    phone: json["Phone"],
    portalRole: json["PortalRole"],
    postalCode: json["PostalCode"],
    receivesAdminInfoEmails: json["ReceivesAdminInfoEmails"],
    receivesInfoEmails: json["ReceivesInfoEmails"],
    senderEmail: json["SenderEmail"],
    senderName: json["SenderName"],
    signature: json["Signature"],
    smallBannerPhotoUrl: json["SmallBannerPhotoUrl"],
    smallPhotoUrl: json["SmallPhotoUrl"],
    state: json["State"],
    stayInTouchNote: json["StayInTouchNote"],
    stayInTouchSignature: json["StayInTouchSignature"],
    stayInTouchSubject: json["StayInTouchSubject"],
    street: json["Street"],
    suffix: json["Suffix"],
    systemModstamp: json["SystemModstamp"],
    timeZoneSidKey: json["TimeZoneSidKey"],
    title: json["Title"],
    username: json["Username"],
    userRoleId: json["UserRoleId"],
    userType: json["UserType"],
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes.toJson(),
    "AboutMe": aboutMe,
    "AccountId": accountId,
    "Address": address,
    "Alias": alias,
    "BadgeText": badgeText,
    "BannerPhotoUrl": bannerPhotoUrl,
    "CallCenterId": callCenterId,
    "City": city,
    "CommunityNickname": communityNickname,
    "CompanyName": companyName,
    "ContactId": contactId,
    "Contact_Id__c": contactIdC,
    "Contact_Record__c": contactRecordC,
    "Country": country,
    "CreatedById": createdById,
    "CreatedDate": createdDate,
    "DelegatedApproverId": delegatedApproverId,
    "Department": department,
    "DigestFrequency": digestFrequency,
    "Division": division,
    "Email": email,
    "EmailEncodingKey": emailEncodingKey,
    "EmailPreferencesAutoBcc": emailPreferencesAutoBcc,
    "EmailPreferencesAutoBccStayInTouch": emailPreferencesAutoBccStayInTouch,
    "EmailPreferencesStayInTouchReminder": emailPreferencesStayInTouchReminder,
    "EmployeeNumber": employeeNumber,
    "Extension": extension,
    "Fax": fax,
    "FederationIdentifier": federationIdentifier,
    "FirstName": firstName,
    "ForecastEnabled": forecastEnabled,
    "FullPhotoUrl": fullPhotoUrl,
    "GeocodeAccuracy": geocodeAccuracy,
    "Id": id,
    "IsActive": isActive,
    "IsExtIndicatorVisible": isExtIndicatorVisible,
    "IsPortalEnabled": isPortalEnabled,
    "IsProfilePhotoActive": isProfilePhotoActive,
    "LanguageLocaleKey": languageLocaleKey,
    "LastLoginDate": lastLoginDate,
    "LastModifiedById": lastModifiedById,
    "LastModifiedDate": lastModifiedDate,
    "LastName": lastName,
    "LastReferencedDate": lastReferencedDate,
    "LastViewedDate": lastViewedDate,
    "Latitude": latitude,
    "LocaleSidKey": localeSidKey,
    "Longitude": longitude,
    "ManagerId": managerId,
    "MediumBannerPhotoUrl": mediumBannerPhotoUrl,
    "MediumPhotoUrl": mediumPhotoUrl,
    "MiddleName": middleName,
    "MobilePhone": mobilePhone,
    "Name": name,
    "OfflinePdaTrialExpirationDate": offlinePdaTrialExpirationDate,
    "OfflineTrialExpirationDate": offlineTrialExpirationDate,
    "OutOfOfficeMessage": outOfOfficeMessage,
    "Phone": phone,
    "PortalRole": portalRole,
    "PostalCode": postalCode,
    "ReceivesAdminInfoEmails": receivesAdminInfoEmails,
    "ReceivesInfoEmails": receivesInfoEmails,
    "SenderEmail": senderEmail,
    "SenderName": senderName,
    "Signature": signature,
    "SmallBannerPhotoUrl": smallBannerPhotoUrl,
    "SmallPhotoUrl": smallPhotoUrl,
    "State": state,
    "StayInTouchNote": stayInTouchNote,
    "StayInTouchSignature": stayInTouchSignature,
    "StayInTouchSubject": stayInTouchSubject,
    "Street": street,
    "Suffix": suffix,
    "SystemModstamp": systemModstamp,
    "TimeZoneSidKey": timeZoneSidKey,
    "Title": title,
    "Username": username,
    "UserRoleId": userRoleId,
    "UserType": userType,
  };
}

class Attributes {
  String type;
  String url;

  Attributes({
    this.type,
    this.url,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => new Attributes(
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "url": url,
  };
}
