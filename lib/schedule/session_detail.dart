import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfestfl/home/session.dart';
import 'package:devfestfl/home/speaker.dart';
import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";
  final Session session;
  final SpeakerAtSession speakerAtSession;
  final Speaker speaker;

  const SessionDetail(
      {Key? key,
      required this.session,
      required this.speakerAtSession,
      required this.speaker})
      : super(key: key);

  Widget socialActions(BuildContext context, Speaker speaker) {
    final filteredLinks =
        speaker.links.where((link) => link.url.isNotEmpty).toList();

    if (filteredLinks.isEmpty) {
      // Fallback: If no social links, display button to website
      return IconButton(
        icon: const Icon(FontAwesomeIcons.globe, size: 15),
        onPressed: () {
          launchUrl(Uri.parse('https://devfestflorida.com'));
        },
      );
    }

    // If social links exist, show buttons for each link
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (var link in filteredLinks)
            IconButton(
              icon: Icon(_getIconForLinkType(link.linkType), size: 15),
              onPressed: () {
                launchUrl(Uri.parse(link.url));
              },
            ),
        ],
      ),
    );
  }

  IconData _getIconForLinkType(String linkType) {
    switch (linkType) {
      case 'Twitter':
        return FontAwesomeIcons.twitter;
      case 'LinkedIn':
        return FontAwesomeIcons.linkedinIn;
      case 'GitHub':
        return FontAwesomeIcons.github;
      case 'Facebook':
        return FontAwesomeIcons.facebook;
      case 'Instagram':
        return FontAwesomeIcons.instagram;
      case 'Blog':
        return FontAwesomeIcons.blog;
      case 'Company_Website':
        return FontAwesomeIcons.link;
      default:
        return FontAwesomeIcons.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: session.id,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.white,
                    backgroundImage: session.isServiceSession
                        ? const AssetImage(
                            'assets/images/DF24-Attendee-badge.png')
                        : CachedNetworkImageProvider(speaker.profilePicture)
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                speaker.tagLine,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      color: Tools.multiColors[Random().nextInt(4)],
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                speaker.fullName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Location: ${session.room}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      color: Tools.multiColors[Random().nextInt(4)],
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: "Session Description: ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: session.description ?? 'Social Activity',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                speaker.firstName.isNotEmpty
                    ? "Engage with ${speaker.firstName} on social media 👇"
                    : "Engage with DevFest on social media 👇",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 13, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 20,
              ),
              socialActions(context, speaker),
            ],
          ),
        ),
      ),
      title: session.title,
    );
  }
}
