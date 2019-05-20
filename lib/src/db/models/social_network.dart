import 'dart:convert';

SocialNetwork accountFromJson(String str) {
  final jsonData = json.decode(str);
  return SocialNetwork.fromMap(jsonData);
}

String accountToJson(SocialNetwork data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class SocialNetwork {
  int id;
  String url;
  String type; // type: Facebook, LinkedIn, Twitter.
  int profileId;

  SocialNetwork({this.id, this.url, this.type, this.profileId});

  factory SocialNetwork.fromMap(Map<String, dynamic> json) => new SocialNetwork(
    id: json["id"],
    url: json["url"],
    type: json["type"],
    profileId: json["profileId"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "url": url,
    "type": type,
    "profileId": profileId
  };
}
