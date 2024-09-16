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
  String bio;
  String image;
  String twitterUrl;
  String linkedinUrl;
  String facebookUrl;
  String githubUrl;
  String blogUrl;
  String companyUrl;

  Team({
    required this.id,
    required this.name,
    required this.role,
    required this.bio,
    required this.image,
    required this.twitterUrl,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.githubUrl,
    required this.blogUrl,
    required this.companyUrl,
  });

  Team.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        role = json['role'] ?? '',
        bio = json['bio'] ?? '',
        image = json['image'] ?? '',
        twitterUrl = json['twitter_url'] ?? '',
        linkedinUrl = json['linkedin_url'] ?? '',
        facebookUrl = json['facebook_url'] ?? '',
        githubUrl = json['github_url'] ?? '',
        blogUrl = json['blog_url'] ?? '',
        companyUrl = json['company_url'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['bio'] = bio;
    data['image'] = image;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    data['facebook_url'] = facebookUrl;
    data['github_url'] = githubUrl;
    data['blog_url'] = blogUrl;
    data['company_url'] = companyUrl;
    return data;
  }
}

List<Team> teams = [
  Team(
    id: 1,
    name: "Michael Rosario",
    role: "Lead Organizer",
    bio:
        "As an experienced software developer with over 19 years of experience, I enjoy helping organizations with agile software development, promoting cultures of innovation, and creative business solutions. I enjoy helping organizations and software teams discover the craft of continuous improvement. I am always looking for opportunities to serve leaders and teams who want to create more value with integrity, character, and predictability. Professional interests: AR/VR, Web dev, MAKERS movement, Agile leadership, Machine learning, Cultures of Innovation, Gaming & Game based learning, Visual analytics",
    image: "assets/images/team/michael_rosario.jpg",
    twitterUrl: "https://twitter.com/michaelrosario",
    linkedinUrl: "https://www.linkedin.com/in/michaelprosario",
    facebookUrl: "",
    githubUrl: "https://github.com/michaelprosario",
    blogUrl: "https://inspiredtoeducate.net/inspiredtoeducate/",
    companyUrl: "https://designinteractive.net/",
  ),
  Team(
    id: 2,
    name: "Christi Kapp",
    role: "Founder / Organizer",
    bio:
        "Christi Kapp is a well-respected Management Consultant and Coach that has spoken at numerous professional conferences on topics ranging from business analysis, to managing organizational change. Christi’s career has included management consulting, executive leadership, coaching and teaching in the hospitality, training and technology industries. She has also managed performance, as well as the professional development of staff engaged in development and delivery of complex information system solutions, solution sales, training, and customer service. Her entrepreneurial background includes founding, growing and selling TechKnowQuest, Inc – one of the Orlando Area's Fastest Growing Tech Companies in 1998 (1992 – 2000). While at TechKnowQuest, she created custom courses for a number of clients and performed management consulting services. She has also performed coaching and consulting services through KnowledgeSpot, Inc, (2000 – 2007) and JustIntegration, Inc. (founded in 2006). She was also co-founder of Art In Motion LLC Custom Motorcycles (founded in 2007), and is Owner/Innkeeper at Kapp and Kappy Bed & Breakfast (2016) She is an accomplished author also. She has written several enterprise information technology books (Prentice-Hall), a UCF Master's thesis on “Regional Readiness for Homeland Security Information Sharing”, and in 2016, wrote a book chapter titled “Soft Factors Enabling Innovation” in the Apple Academic Press series called Ecosystems and Technology: Idea Generation and Content Model Processing. She has a B.S. Degree from the University of Rochester and a M.S. from the College of Health & Public Affairs at the University of Central Florida.",
    image: "assets/images/team/christi_kapp.png",
    twitterUrl: "https://x.com/datapsyinc",
    linkedinUrl: "https://www.linkedin.com/in/artinmotionllc/",
    facebookUrl: 'https://www.facebook.com/DataPsy/',
    githubUrl: "",
    blogUrl: "",
    companyUrl: "https://www.violetsgarage.com/",
  ),
  Team(
    id: 3,
    name: "Kendra Kennedy",
    role: "Organizer",
    bio:
        "Hello everyone! My name is Kendra Kennedy, and I am a Software Engineer who specializes in eXtended Reality (XR) Development and dabbles in Web Development, Mobile Development, and a bit of Machine Learning. I have a deep love for learning and trying out new skills, so when I'm not behind the keyboard I can be often be found taking acting, dancing, or media art classes from the nearby art center or martial arts, yoga, or one-off exercise classes at my local gym. I'm happy to be a part of such an awesome team and look forward to learning and creating with all of you!",
    image: "assets/images/team/kendra.jpeg",
    twitterUrl: "",
    linkedinUrl: "https://www.linkedin.com/in/kendra-kennedy-20395a90/",
    facebookUrl: "",
    githubUrl: "",
    blogUrl: "",
    companyUrl: "https://designinteractive.net/",
  ),
  Team(
    id: 4,
    name: "Javier 'Javi' Carrion",
    role: "Organizer",
    bio:
        "Hi everyone! My name is Javier, but you can call me \"Javi.\" I live in Ocala, known as  \"the Horse Capital of the World\" and I'm actively involved in the Central Florida Development communities. As a Software Engineer (Web) at Design Interactive, I work with cutting-edge human-system integration (HSI) technologies, which means I get to play with devices like HoloLens and more. Fun Fact: I have a mixology certification from the city of Waterbury! 🍸 I'm excited to be a part of this amazing group and looking forward to connecting with all of you! 🚀",
    image: "assets/images/team/javi.jpg",
    twitterUrl: "https://twitter.com/seetechnologic",
    linkedinUrl: "https://www.linkedin.com/in/technologic/",
    facebookUrl: "",
    githubUrl: "https://github.com/JavaVista",
    blogUrl: "https://googledevsflorida.blogspot.com/",
    companyUrl: "https://designinteractive.net/",
  ),
];
