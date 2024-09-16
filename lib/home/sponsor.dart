class SponsorsData {
  List<Sponsor> sponsors;

  SponsorsData({required this.sponsors});

  SponsorsData.fromJson(Map<String, dynamic> json) : sponsors = [] {
    if (json['sponsors'] != null) {
      json['sponsors'].forEach((v) {
        sponsors.add(Sponsor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sponsors'] = sponsors.map((v) => v.toJson()).toList();
    return data;
  }
}

class Sponsor {
  String name;
  String image;
  String desc;
  String url;

  Sponsor({
    required this.name,
    required this.image,
    required this.desc,
    required this.url,
  });

  Sponsor.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        image = json['image'] ?? '',
        desc = json['desc'] ?? '',
        url = json['url'] ?? '';
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['desc'] = desc;
    data['url'] = url;
    return data;
  }
}

List<Sponsor> sponsors = [
  Sponsor(
    name: "Google",
    image: "assets/images/sponsors/Google_2015_logo.png",
    desc: "Partner Sponsor",
    url: 'https://developers.google.com/',
  ),
  Sponsor(
    name: "Seminole State College",
    image: "assets/images/sponsors/logo-seminole-state.png",
    desc: "Partner Sponsor",
    url: 'https://www.seminolestate.edu/',
  ),
  Sponsor(
    name: "BOT",
    image: "assets/images/sponsors/bot_male_master_logo.jpg",
    desc: "Gold Sponsor",
    url: 'https://blackorlandotech.org/',
  ),
  // Sponsor(
  //   name: "TEKsystems",
  //   image:
  //       "https://www.premiertalentpartners.com/wp-content/uploads/2018/11/teksystems-logo.jpg",
  //   desc: "Silver Sponsor",
  //   url: 'https://www.teksystems.com/',
  // ),
    Sponsor(
    name: "DataPsy",
    image: "assets/images/sponsors/DataPsy_Logo.jpg",
    desc: "Copper Sponsor",
    url: 'http://www.datapsy.com/',
  ),
  Sponsor(
    name: "Kodeco",
    image: "assets/images/sponsors/kodeco.png",
    desc: "Supporter Sponsor",
    url: 'https://www.kodeco.com/',
  ),

  Sponsor(
    name: "JetBrains",
    image:
        "assets/images/sponsors/jetbrains.png",
    desc: "Supporter Partner",
    url: 'https://www.jetbrains.com//',
  ),
];
