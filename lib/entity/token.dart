class Token {
  String? token;

  Token({required this.token});

  factory Token.fromJson(Map<String, String> json) {
    return Token(
      token: json["token"]
    );
  }
}