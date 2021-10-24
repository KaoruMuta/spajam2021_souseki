class SenderUser {
  final String id;
  final String name;

  SenderUser({required this.id, required this.name});

  factory SenderUser.fromJson(Map<String, dynamic> json) {
    return SenderUser(
      id: json["id"],
      name: json["name"],
    );
  }
}
