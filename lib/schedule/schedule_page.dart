import 'dart:math';

import 'package:devfestfl/home/group.dart';
import 'package:devfestfl/home/speaker.dart';
import 'package:devfestfl/schedule/session_list.dart';
import 'package:devfestfl/services/sessionize_api_service.dart';
import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulePage extends StatefulWidget {
  static const String routeName = "/schedule";

  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  late Future<List<Group>> _sessionsFuture;
  late Future<List<Speaker>> _speakersFuture;

  @override
  void initState() {
    super.initState();
    _sessionsFuture = SessionizeApiService().getSessions();
    _speakersFuture = SessionizeApiService().getSpeakers();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: DevScaffold(
        title: "Schedule",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          isScrollable: true,
          labelStyle: const TextStyle(fontSize: 12),
          tabs: const <Widget>[
            Tab(
              icon: Icon(FontAwesomeIcons.users, size: 20),
              child: Text("Activity"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.globe,
                size: 20,
              ),
              child: Text("Web"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.mobile,
                size: 20,
              ),
              child: Text("Mobile"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.cloud,
                size: 20,
              ),
              child: Text("Cloud"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.rocket,
                size: 20,
              ),
              child: Text("Startups"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.handSparkles,
                size: 20,
              ),
              child: Text("AI"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.briefcase,
                size: 20,
              ),
              child: Text("Career"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.wrench,
                size: 20,
              ),
              child: Text("Workshops"),
            ),
          ],
        ),
        body: FutureBuilder<List<Group>>(
          future: _sessionsFuture,
          builder: (context, sessionsSnapshot) {
            if (sessionsSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (sessionsSnapshot.hasError) {
              return Center(
                  child: Text(
                      'Error: ${sessionsSnapshot.error}. Please connect to the internet to view the latest schedule.'));
            } else if (!sessionsSnapshot.hasData ||
                sessionsSnapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                      'No sessions found. Please connect to the internet to view the latest schedule.'));
            }

            return FutureBuilder<List<Speaker>>(
              future: _speakersFuture,
              builder: (context, speakersSnapshot) {
                if (speakersSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (speakersSnapshot.hasError) {
                  return Center(
                      child: Text('Error: ${speakersSnapshot.error}'));
                } else if (!speakersSnapshot.hasData ||
                    speakersSnapshot.data!.isEmpty) {
                  return const Center(child: Text('No speakers found'));
                }

                final groups = sessionsSnapshot.data!;
                final sessions =
                    groups.expand((group) => group.sessions).toList();
                final speakers = speakersSnapshot.data!;

                final serviceSessions =
                    sessions.where((s) => s.isServiceSession).toList();
                final webSessions =
                    sessions.where((s) => s.room.startsWith("Web")).toList();
                final mobileSessions =
                    sessions.where((s) => s.room.startsWith("Mobile")).toList();
                final cloudSessions =
                    sessions.where((s) => s.room.startsWith("Cloud")).toList();
                final startupsSessions =
                    sessions.where((s) => s.room.startsWith("Startup")).toList();
                final aiSessions =
                    sessions.where((s) => s.room.startsWith("AI")).toList();
                final careerSessions =
                    sessions.where((s) => s.room.startsWith("Career")).toList();
                final workshopsSessions =
                    sessions.where((s) => s.room.startsWith("Workshops")).toList();
                return TabBarView(
                  children: <Widget>[
                    SessionList(
                      allSessions: serviceSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: webSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: mobileSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: cloudSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: startupsSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: aiSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: careerSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                    SessionList(
                      allSessions: workshopsSessions,
                      speakers: speakers,
                      other: const [],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
