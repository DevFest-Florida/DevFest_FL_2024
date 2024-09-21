class TeamsData {
  List<Team> teams;

  TeamsData({required this.teams});

  TeamsData.fromJson(Map<String, dynamic> json) : teams = [] {
    if (json['teams'] != null) {
      json['teams'].forEach((v) {
        teams.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teams'] = teams.map((v) => v.toJson()).toList();
    return data;
  }
}

class Team {
  int id;
  String name;
  String role;
  String company;
  String position;
  String bio;
  String image;
  String twitterUrl;
  String linkedinUrl;
  String facebookUrl;
  String discordUrl;
  String githubUrl;
  String personalUrl;
  String blogUrl;
  String companyUrl;
  String gdgChapter;

  Team({
    required this.id,
    required this.name,
    required this.role,
    required this.company,
    required this.position,
    required this.bio,
    required this.image,
    required this.twitterUrl,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.discordUrl,
    required this.githubUrl,
    required this.personalUrl,
    required this.blogUrl,
    required this.companyUrl,
    required this.gdgChapter,
  });

  Team.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        role = json['role'] ?? '',
        company = json['company'] ?? '',
        position = json['position'] ?? '',
        bio = json['bio'] ?? '',
        image = json['image'] ?? '',
        twitterUrl = json['twitter_url'] ?? '',
        linkedinUrl = json['linkedin_url'] ?? '',
        facebookUrl = json['facebook_url'] ?? '',
        discordUrl = json['discord_url'] ?? '',
        githubUrl = json['github_url'] ?? '',
        personalUrl = json['personal_url'] ?? '',
        blogUrl = json['blog_url'] ?? '',
        companyUrl = json['company_url'] ?? '',
        gdgChapter = json['gdg_chapter'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['company'] = company;
    data['position'] = position;
    data['bio'] = bio;
    data['image'] = image;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    data['facebook_url'] = facebookUrl;
    data['discord_url'] = discordUrl;
    data['github_url'] = githubUrl;
    data['personal_url'] = personalUrl;
    data['blog_url'] = blogUrl;
    data['company_url'] = companyUrl;
    data['gdg_chapter'] = gdgChapter;
    return data;
  }
}

class GDGChapter {
  String name;
  String chapterUrl;
  List<Team> members;

  GDGChapter(
      {required this.name, required this.chapterUrl, required this.members});
}

List<GDGChapter> gdgChapters = [
  GDGChapter(
      name: "GDG Central Florida",
      chapterUrl: "https://gdg.community.dev/gdg-central-florida/",
      members: [
        Team(
          id: 1,
          name: "Michael Rosario",
          role: "Lead Organizer",
          company: "Design Interactive Inc.",
          position: "Software Engineer IV",
          bio:
              "As an experienced software developer with over 19 years of experience, I enjoy helping organizations with agile software development, promoting cultures of innovation, and creative business solutions. I enjoy helping organizations and software teams discover the craft of continuous improvement. I am always looking for opportunities to serve leaders and teams who want to create more value with integrity, character, and predictability. Professional interests: AR/VR, Web dev, MAKERS movement, Agile leadership, Machine learning, Cultures of Innovation, Gaming & Game based learning, Visual analytics",
          image: "assets/images/team/michael_rosario.jpg",
          twitterUrl: "https://twitter.com/michaelrosario",
          linkedinUrl: "https://www.linkedin.com/in/michaelprosario",
          facebookUrl: "",
          discordUrl: "https://discord.gg/GngG5Ma9",
          githubUrl: "https://www.linkedin.com/in/michaelprosario/",
          personalUrl: "",
          blogUrl: "https://inspiredtoeducate.net/inspiredtoeducate/",
          companyUrl: "https://designinteractive.net/",
          gdgChapter: "GDG Central Florida",
        ),
        Team(
          id: 2,
          name: "Christi Kapp",
          role: "Founder / Organizer",
          company: "DataPsy, Inc.",
          position: "Founder & CEO",
          bio:
              "I am a Technical Management Consultant who helps organizations identify and harness the power of creative thinking within their ranks to create and deliver on roadmaps that accelerate re-invention of their organization. I have played numerous roles throughout my career including Executive Leadership, Technology Leader, Business Management Consultant and more. I thrive in environments that value contributions of people that have a unique ability to \"connect the dots between disparate aspects of an organization\" to enable desired business outcomes.",
          image: "assets/images/team/christi_kapp.jpg",
          twitterUrl: "https://x.com/datapsyinc",
          linkedinUrl: "https://www.linkedin.com/in/artinmotionllc/",
          facebookUrl: 'https://www.facebook.com/DataPsy/',
          discordUrl: "https://discord.gg/GngG5Ma9",
          githubUrl: "",
          personalUrl: "",
          blogUrl: "",
          companyUrl: "https://www.violetsgarage.com/",
          gdgChapter: "GDG Central FLorida",
        ),
        Team(
          id: 3,
          name: "Kendra Kennedy",
          role: "Organizer",
          company: "Design Interactive Inc.",
          position: "Software Engineer II",
          bio:
              "Hello everyone! My name is Kendra Kennedy, and I am a Software Engineer who specializes in eXtended Reality (XR) Development and dabbles in Web Development, Mobile Development, and a bit of Machine Learning. I have a deep love for learning and trying out new skills, so when I'm not behind the keyboard I can be often be found taking acting, dancing, or media art classes from the nearby art center or martial arts, yoga, or one-off exercise classes at my local gym. I'm happy to be a part of such an awesome team and look forward to learning and creating with all of you!",
          image: "assets/images/team/kendra.jpeg",
          twitterUrl: "",
          linkedinUrl: "https://www.linkedin.com/in/kendra-kennedy-20395a90/",
          facebookUrl: "",
          discordUrl: "https://discord.gg/GngG5Ma9",
          githubUrl: "",
          personalUrl: "",
          blogUrl: "",
          companyUrl: "https://designinteractive.net/",
          gdgChapter: "GDG Central FLorida",
        ),
        Team(
          id: 4,
          name: "Javier 'Javi' Carrion",
          role: "Organizer",
          company: "Design Interactive Inc.",
          position: "Software Engineer II",
          bio:
              "Hi everyone! My name is Javier, but you can call me \"Javi.\" I live in Ocala, known as  \"the Horse Capital of the World\" and I'm actively involved in the Central Florida Development communities. As a Software Engineer (Web) at Design Interactive, I work with cutting-edge human-system integration (HSI) technologies, which means I get to play with devices like HoloLens and more. Fun Fact: I have a mixology certification from the city of Waterbury! 🍸 I'm excited to be a part of this amazing group and looking forward to connecting with all of you! 🚀",
          image: "assets/images/team/javi.jpg",
          twitterUrl: "https://twitter.com/seetechnologic",
          linkedinUrl: "https://www.linkedin.com/in/technologic/",
          facebookUrl: "",
          discordUrl: "https://discord.gg/GngG5Ma9",
          githubUrl: "https://github.com/JavaVista",
          personalUrl: "https://techno-logic.us/",
          blogUrl: "https://googledevsflorida.blogspot.com/",
          companyUrl: "https://designinteractive.net/",
          gdgChapter: "GDG Central FLorida",
        ),
      ]),
  GDGChapter(
      name: "GDG Space Coast",
      chapterUrl: "https://gdg.community.dev/gdg-space-coast/",
      members: [
        Team(
          id: 5,
          name: "Gilberto Creque",
          role: "Organizer",
          company: "Codecraft Works",
          position: "Senior Software Engineer",
          bio:
              "I'm a Senior Software Engineer and full-stack web developer at Codecraft Works, where I lead software development working on an NSF backed education technology platform. I am graduate of UCF University of Central Florida (Go Knights!) but I consider myself a life-long learner, technologist, and tech early-adopter. I currently do work in Angular, Firebase, Google Cloud, ASP.NET, AWS, and STEM Education. I dabble in PHP (I used to primarily work in Wordpress and then Drupal), Python, and Java. I am also an organizer for Google Developer Group Space Coast",
          image: "assets/images/team/gil.jpg",
          twitterUrl: "https://x.com/gildotdev",
          linkedinUrl: "https://www.linkedin.com/in/gildotdev/",
          facebookUrl: "",
          discordUrl: "https://discord.com/invite/TbQEhP6HPr",
          githubUrl: "",
          personalUrl: "https://gil.dev/",
          blogUrl: "https://gilcreque.blog/",
          companyUrl: "https://codecraftworks.com/",
          gdgChapter: "GDG Space Coast",
        ),
      ]),
  GDGChapter(
      name: "GDG Tampa Bay",
      chapterUrl: "https://gdg.community.dev/gdg-tampa-bay/",
      members: [
        Team(
          id: 6,
          name: "Carol Bolger",
          role: "Organizer",
          company: "Real World Applications",
          position: "Independent Business Owner",
          bio:
              "With over 27 years of professional experience, my journey has been dedicated to mastering software development. My mission is to innovate and streamline digital solutions that resonate with users across various platforms. This dedication to tech excellence is married to a commitment to the organization's values, where I continuously strive to infuse our work with creativity and strategic foresight, ensuring our products not only meet but exceed market expectations. Most recently, my focus has been on developing robust mobile applications using Flutter and Firebase, and advancing web applications with Laravel and MySQL. I've successfully launched several custom built web and mobile applications. My role involves not just development but also ensuring quality and training end-users to engage effectively with new systems, thereby enhancing overall user experience and satisfaction.",
          image: "assets/images/team/Carol.jpg",
          twitterUrl: "",
          linkedinUrl: "https://www.linkedin.com/in/carolcorybolger/",
          facebookUrl: "",
          discordUrl: "",
          githubUrl: "",
          personalUrl: "",
          blogUrl: "",
          companyUrl: "",
          gdgChapter: "GDG Tampa Bay",
        ),
        Team(
          id: 7,
          name: "Krish Veera ",
          role: "Organizer",
          company: "University of South Florida",
          position: "AI Research Student",
          bio:
              "I am a tech enthusiast who is majoring in Computer Science and Physics at the University of South Florida. I have been a GDSC Lead for the past year and have been organizing events for GDSC at USF for the past two years.",
          image: "assets/images/team/Krish.jpg",
          twitterUrl: "",
          linkedinUrl: "https://www.linkedin.com/in/krish-veera/",
          facebookUrl: "",
          discordUrl: "",
          githubUrl: "",
          personalUrl: "",
          blogUrl: "",
          companyUrl: "",
          gdgChapter: "GDG Tampa Bay",
        ),
      ]),
];
