import 'dart:math';

import 'package:devfestfl/home/team.dart';
import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatefulWidget {
  static const String routeName = "/team";

  const TeamPage({Key? key}) : super(key: key);

  @override
  TeamPageState createState() => TeamPageState();
}

class TeamPageState extends State<TeamPage> {
  final List<bool> _isExpanded = List.generate(teams.length, (_) => false);

  Widget socialActions(context, Team team) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (team.twitterUrl.isNotEmpty)
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.twitter,
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.twitterUrl));
                },
              ),
            if (team.linkedinUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _getIconForLinkType('LinkedIn'),
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.linkedinUrl));
                },
              ),
            if (team.facebookUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _getIconForLinkType('Facebook'),
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.facebookUrl));
                },
              ),
            if (team.githubUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _getIconForLinkType('GitHub'),
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.githubUrl));
                },
              ),
            if (team.blogUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _getIconForLinkType('Blog'),
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.blogUrl));
                },
              ),
            if (team.companyUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _getIconForLinkType('Company_Website'),
                  size: 15,
                ),
                onPressed: () {
                  launchUrl(Uri.parse(team.companyUrl));
                },
              ),
          ],
        ),
      );

  IconData _getIconForLinkType(String linkType) {
    switch (linkType) {
      case 'Twitter':
        return FontAwesomeIcons.twitter;
      case 'LinkedIn':
        return FontAwesomeIcons.linkedinIn;
      case 'Facebook':
        return FontAwesomeIcons.facebook;
      case 'GitHub':
        return FontAwesomeIcons.github;
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
      title: "Team",
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: teams.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: Hero(
                      tag: teams[index].id,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          teams[index].image,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              teams[index].name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 5,
                              color: Tools.multiColors[Random().nextInt(4)],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          teams[index].role,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _isExpanded[index]
                              ? teams[index].bio
                              : "${teams[index].bio.substring(0, 120)}...",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index];
                            });
                          },
                          child: Text(
                            _isExpanded[index] ? "less" : "more",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Tools.multiColors[Random().nextInt(4)],
                                ),
                          ),
                        ),
                        socialActions(context, teams[index]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
