import 'package:spajam2021_souseki/entity/sender_user.dart';

class ReceivedMessageResponse {
  final String text;
  final SenderUser senderUser;
  final bool isRead;

  ReceivedMessageResponse({required this.text, required this.senderUser, required this.isRead});
}