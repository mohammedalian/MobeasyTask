import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'app/my_app.dart';
import 'firebase_options.dart';
import 'presentation/resources/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initOneSignal();

  runApp(MyApp());
}


void initOneSignal() {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(AppStrings.oneSignalAppId);
  OneSignal.Notifications.requestPermission(true);
}
