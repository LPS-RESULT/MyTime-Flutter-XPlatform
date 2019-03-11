import 'package:mytime_mobile/models/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_ACCESS_TOKEN = 'prefsAccessToken';
const String PREFS_INSTANCE_URL = 'prefsInstanceUrl';
const String PREFS_AUTH_ID = 'prefsAuthId';
const String PREFS_AUTH_SIGNATURE = 'prefsSignature';
const String PREFS_USERNAME = 'prefsUsername';

Future<SfAuthResponse> getAuthFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return SfAuthResponse(
    accessToken: prefs.getString(PREFS_ACCESS_TOKEN),
    id: prefs.get(PREFS_AUTH_ID),
    signature: prefs.get(PREFS_AUTH_SIGNATURE),
    instanceUrl: prefs.get(PREFS_INSTANCE_URL),
    username: prefs.get(PREFS_USERNAME),
  );
}