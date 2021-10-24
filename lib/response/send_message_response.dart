class SendMessageResponse {
  final int? replyMessageId;
  final int waitingPeriod;

  SendMessageResponse({required this.waitingPeriod, this.replyMessageId});

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      replyMessageId: json["reply_message_id"] as int?,
      waitingPeriod: json["waiting_period"] as int,
    );
  }
}