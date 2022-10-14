import 'dart:convert';

class FirebaseUser {
  /// - dont include id in the json converters

  final String email;
  final String? name;
  final String profilePic;

  const FirebaseUser({
    required this.email,
    this.name,
    required this.profilePic,
  });

  FirebaseUser copyWith({
    String? email,
    String? name,
    String? profilePic,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'profilePic': profilePic,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
      name: map['name'],
      profilePic: map['profilePic'] ?? "http://www.gravatar.com/avatar/?d=mp",
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'FirebaseUser(email: $email, name: $name, profilePic: $profilePic)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseUser &&
        other.email == email &&
        other.name == name &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ profilePic.hashCode;
}