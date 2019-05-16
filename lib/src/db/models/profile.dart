import 'dart:convert';

Profile profileFromJson(String str) {
  final jsonData = json.decode(str);
  return Profile.fromMap(jsonData);
}

String profileToJson(Profile data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Profile {
  int id;
  String firstname;
  String lastname;
  String position;
  String email;
  String tel;
  String company;
  String facebookUrl;
  String linkedlnUrl;
  String twitterUrl;
  String instagramUrl;

  Profile({this.id, this.firstname, this.lastname, this.position, this.email,
      this.tel, this.company, this.facebookUrl, this.linkedlnUrl,
      this.twitterUrl, this.instagramUrl});

  factory Profile.fromMap(Map<String, dynamic> json) => new Profile(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    position: json["position"],
    email: json["email"],
    tel: json["tel"],
    company: json["company"],
    facebookUrl: json["facebookUrl"],
    linkedlnUrl: json["linkedlnUrl"],
    twitterUrl: json["twitterUrl"],
    instagramUrl: json["instagramUrl"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstname": firstname,
    "position": position,
    "email": email,
    "tel": tel,
    "company": company,
    "facebookUrl": facebookUrl,
    "linkedlnUrl": linkedlnUrl,
    "twitterUrl": twitterUrl,
    "instagramUrl": instagramUrl
  };
}
