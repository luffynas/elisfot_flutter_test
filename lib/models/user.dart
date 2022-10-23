import 'created.dart';

class User {
  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  User({this.name, this.email, this.phoneNumber, this.created, this.uuid});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phone_number'] as String?,
        created: json['created'] == null
            ? null
            : Created.fromJson(json['created'] as Map<String, dynamic>),
        uuid: json['uuid'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'created': created?.toJson(),
        'uuid': uuid,
      };
}
