import 'dart:math';

import 'package:devfestfl/config/config_bloc.dart';
import 'package:devfestfl/faq/faq_page.dart';
import 'package:devfestfl/map/map_page.dart';
import 'package:devfestfl/schedule/schedule_page.dart';
import 'package:devfestfl/speakers/speakers_page.dart';
import 'package:devfestfl/sponsors/sponsor_page.dart';
import 'package:devfestfl/team/team_page.dart';
import 'package:devfestfl/universal/image_card.dart';
import 'package:devfestfl/utils/devfest.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatefulWidget {
  const HomeFront({Key? key}) : super(key: key);

  @override
  HomeFrontState createState() => HomeFrontState();
}

class HomeFrontState extends State<HomeFront> {
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    // Show the tooltip when the home page is loaded
    Future.delayed(const Duration(milliseconds: 5000), () {
      _tooltipKey.currentState?.ensureTooltipVisible();
    });
  }

  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          Devfest.subtitleText,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        ExpansionTile(
          title: Text(
            Devfest.descTitle,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Text(
                    Devfest.descText,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ];

  Widget socialActions(context) => MouseRegion(
        onEnter: (_) => _tooltipKey.currentState?.ensureTooltipVisible(),
        onExit: (_) => _tooltipKey.currentState?.deactivate(),
        child: Tooltip(
          key: _tooltipKey,
          message: "Connect with us on social media and join our community!",
          waitDuration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Tools.multiColors[Random().nextInt(4)],
            borderRadius: BorderRadius.circular(8),
          ),
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(FontAwesomeIcons.facebookF),
                  onPressed: () async {
                    const url = "https://www.facebook.com/devfestflorida/";
                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.twitter),
                  onPressed: () async {
                    const url = "https://twitter.com/devfestfl";
                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.linkedinIn),
                  onPressed: () async {
                    const url =
                        "https://www.linkedin.com/company/devfestflorida/";
                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.youtube),
                  onPressed: () async {
                    const url =
                        "https://www.youtube.com/channel/UCKy_rozojea4PZHCVYHqKwg";
                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.google),
                  onPressed: () async {
                    const url =
                        "https://gdg.community.dev/gdg-central-florida/";
                    await launchUrl(Uri.parse(url));
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.discord),
                  onPressed: () async {
                    const url = "https://discord.gg/XRY5Qf4QjK";
                    await launchUrl(Uri.parse(url));
                  },
                ),
              ],
            ),
          ),
        ),
      );
  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 30.0,
        runSpacing: 30.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.schedule,
            color: Colors.red,
            title: Devfest.scheduleText,
            onPressed: () =>
                Navigator.pushNamed(context, SchedulePage.routeName),
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: Devfest.speakersText,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakersPage.routeName),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: Devfest.teamText,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.handshake,
            color: Colors.purple,
            title: Devfest.sponsorText,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.article,
            color: Colors.brown,
            title: Devfest.faqText,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: Devfest.mapText,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? Devfest.bannerDark
                  : Devfest.bannerLight,
            ),
            const SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            const SizedBox(
              height: 20,
            ),
            newActions(context),
            const SizedBox(
              height: 20,
            ),
            socialActions(context),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                const url =
                    "https://developers.google.com/community-guidelines";
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                'Community Guidelines',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Tools.multiColors[Random().nextInt(4)],
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Devfest.appVersion,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.title,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => onPressed(),
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            color: ConfigBloc().darkModeOn
                ? Tools.hexToColor("#1f2124")
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: !ConfigBloc().darkModeOn
                ? [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.blue[200]!,
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
