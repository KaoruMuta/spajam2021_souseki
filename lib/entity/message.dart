import 'package:spajam2021_souseki/entity/sender_user.dart';

class Message {
  final String id;
  final String text;
  final String publicationDate;
  final SenderUser senderUser;

  Message(this.id, this.text, this.publicationDate, this.senderUser);
}