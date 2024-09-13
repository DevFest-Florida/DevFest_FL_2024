class SessionsData {
  List<Session> sessions;

  SessionsData({required this.sessions});

  SessionsData.fromJson(Map<String, dynamic> json) : sessions = [] {
    if (json['sessions'] != null) {
      json['sessions'].forEach((v) {
        sessions.add(Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessions'] = sessions.map((v) => v.toJson()).toList();
    return data;
  }
}

class Session {
  String id;
  String title;
  String? description;
  String startsAt;
  String endsAt;
  bool isServiceSession;
  bool isPlenumSession;
  List<SpeakerAtSession> speakers;
  String room;
  String? recordingUrl;

  Session({
    required this.id,
    required this.title,
    this.description,
    required this.startsAt,
    required this.endsAt,
    required this.isServiceSession,
    required this.isPlenumSession,
    required this.speakers,
    required this.room,
    this.recordingUrl,
  });

  Session.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        description = json['description'],
        startsAt = json['startsAt'] ?? '',
        endsAt = json['endsAt'] ?? '',
        isServiceSession = json['isServiceSession'] ?? false,
        isPlenumSession = json['isPlenumSession'] ?? false,
        speakers = (json['speakers'] as List)
            .map((speaker) => SpeakerAtSession.fromJson(speaker))
            .toList(),
        room = json['room'] ?? '',
        recordingUrl = json['recordingUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['startsAt'] = startsAt;
    data['endsAt'] = endsAt;
    data['isServiceSession'] = isServiceSession;
    data['isPlenumSession'] = isPlenumSession;
    data['speakers'] = speakers.map((speaker) => speaker.toJson()).toList();
    data['room'] = room;
    data['recordingUrl'] = recordingUrl;
    return data;
  }
}

class SpeakerAtSession {
  String id;
  String name;

  SpeakerAtSession({required this.id, required this.name});

  factory SpeakerAtSession.fromJson(Map<String, dynamic> json) {
    return SpeakerAtSession(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}