import 'package:spajam2021_souseki/entity/region.dart';

class User {
  final String id;
  final String name;
  final Region region;

  User({required this.id, required this.name, required this.region});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      region: json["region"],
    );
  }
}