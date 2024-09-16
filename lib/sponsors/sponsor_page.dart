import 'dart:math';

import 'package:devfestfl/home/sponsor.dart';
import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorPage extends StatelessWidget {
  static const String routeName = "/sponsor";

  const SponsorPage({Key? key}) : super(key: key);

  Widget socialActions(context, Sponsor sponsor) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.link,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse(sponsor.url));
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: sponsors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0.0,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Hero(
                        tag: sponsors[index].name,
                        child: Container(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(sponsors[index].image),
                              fit: BoxFit.contain,
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
                                  sponsors[index].name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              sponsors[index].desc,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Tools.multiColors[Random().nextInt(4)],
                                  ),
                            ),
                            socialActions(context, sponsors[index]),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            );
          }),
      title: "Sponsors",
    );
  }
}
