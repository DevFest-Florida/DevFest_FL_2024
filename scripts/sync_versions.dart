// ignore_for_file: avoid_print
// run 'dart sync_versions.dart' to 
// update the version in pubspec.yaml from the devfest.dart

import 'dart:io';

void main() {
  final devfestFile = File('lib/utils/devfest.dart');
  final pubspecFile = File('pubspec.yaml');

  if (!devfestFile.existsSync() || !pubspecFile.existsSync()) {
    print('Required files not found.');
    exit(1);
  }

  final devfestContent = devfestFile.readAsStringSync();
  final versionRegex = RegExp(r'static const String appVersion = "Version (\d+\.\d+\.\d+)";');
  final match = versionRegex.firstMatch(devfestContent);

  if (match == null) {
    print('Version not found in devfest.dart.');
    exit(1);
  }

  final version = match.group(1);
  final pubspecContent = pubspecFile.readAsStringSync();
  final buildNumberRegex = RegExp(r'version: \d+\.\d+\.\d+\+(\d+)');
  final buildNumberMatch = buildNumberRegex.firstMatch(pubspecContent);

  if (buildNumberMatch == null) {
    print('Build number not found in pubspec.yaml.');
    exit(1);
  }

  final currentBuildNumber = int.parse(buildNumberMatch.group(1)!);
  final newBuildNumber = currentBuildNumber + 1;

  final updatedPubspecContent = pubspecContent.replaceFirst(
    buildNumberRegex,
    'version: $version+$newBuildNumber',
  );

  pubspecFile.writeAsStringSync(updatedPubspecContent);
  print('pubspec.yaml updated to version $version+$newBuildNumber.');
}

