import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Devfest {
  static const String appName = "DevFest FL";
  static const String appVersion = "Version 2.4.1";
  static const int appVersionCode = 1;
  static const String appColor = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String googleSansFamily = "GoogleSans";
  static bool isDebugMode = true;

  //* Images

  static const String bannerLight = "assets/images/banner_light.png";
  static const String bannerDark = "assets/images/banner_dark.png";

  //*  Texts
  static const String welcomeText = "Welcome to GDG DevFest Florida \n🌴 🏖️";
  static const String subtitleText = "The most MAGICAL developers conference";
  static const String descTitle = "About DevFest";
  static const String descText =
      '''DevFest is a global tech conference series organized by GDGs. Celebrating its 15th year in 2024, DevFest offers opportunities to learn about Google's developer tools and connect with local tech professionals. DevFest Florida, a prominent part of this series since 2017, provides a platform to explore advanced technologies like AI, mobile development, and cloud computing.''';

  static const String loadingText = "Loading...";
  static const String tryAgainText = "Try Again";
  static const String someErrorText = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

//* ActionTexts
  static const String scheduleText = "Schedule";
  static const String speakersText = "Speakers";
  static const String teamText = "Team";
  static const String sponsorText = "Sponsors";
  static const String faqText = "Blog";
  static const String mapText = "Location";

  //* Preferences
  static SharedPreferences? prefs;
  static const String darkModePref = "darkModePref";
}
