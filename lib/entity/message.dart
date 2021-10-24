import 'package:spajam2021_souseki/entity/sender_user.dart';

class Message {
  final String id;
  final String text;
  final String publicationDate;
  final SenderUser senderUser;

  Message(
      {required this.id,
      required this.text,
      required this.publicationDate,
      required this.senderUser});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json["id"],
        text: json["text"],
        publicationDate: json["publication_date"],
        senderUser: SenderUser.fromJson(json["send_user"]));
  }
}
