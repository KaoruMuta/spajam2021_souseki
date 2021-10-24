import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spajam2021_souseki/entity/message.dart';
import 'package:spajam2021_souseki/entity/region.dart';
import 'package:spajam2021_souseki/entity/sender_user.dart';
import 'package:spajam2021_souseki/entity/token.dart';
import 'package:spajam2021_souseki/entity/user.dart';
import 'package:spajam2021_souseki/response/send_message_response.dart';

class ApiClient {
  static final ApiClient _cache = ApiClient._internal();

  ApiClient._internal();

  factory ApiClient() {
    return _cache;
  }

  // TODO: change url
  final String _baseUrl = 'http://localhost:8080/';

  // TODO: GET /regions
  Future<List<Region>> loadRegions() async {
    final response = await http.get(Uri.parse(_baseUrl + "regions"));
    if (response.statusCode == 200) {
      print(response.body);
      final parsedData = jsonDecode(response.body)['regions'];
      final res =
          parsedData.map<Region>((json) => Region.fromJson(json)).toList();
      return res;
    } else {
      print("Invalid status code: ${response.statusCode}");
      return [];
    }
  }

  // TODO: POST /users
  Future<Token?> register(String name, int regionId) async {
    final response = await http.post(Uri.parse(_baseUrl + "users"),
        body: jsonEncode({"name": name, "region_id": regionId}));
    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body);
      final token = Token.fromJson(parsedData);
      return token;
    }
  }

  // TODO: GET /users
  Future<List<User>> loadPublishedUser() async {
    final response = await http.get(Uri.parse(_baseUrl + "users"));
    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsedData.map<User>((json) => User.fromJson(json)).toList();
    } else {
      print("Invalid status code: ${response.statusCode}");
      return [];
    }
  }

  // TODO: POST /messages
  Future<SendMessageResponse?> sendMessage(String text, int receiverId) async {
    final response = await http.post(
      Uri.parse(_baseUrl + "messages"),
      body: jsonEncode({"text": text, "receiver_id": receiverId}),
    );
    if (response.statusCode == 200) {
      final sendMessageResponse = jsonDecode(response.body);
      return sendMessageResponse;
    }
  }

  // TODO: GET /messages/receive
  Future<List<Message>> loadReceivedMessage() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String token = pref.get("token") as String;
      final response = await http.get(
        Uri.parse(_baseUrl + "messages/received"),
        headers: {
          // TODO: insert token
          HttpHeaders.authorizationHeader: token,
        },
      );
      print('AAAAAAAAAAA ${response.body}');

      if (response.statusCode == 200) {
        final sendMessageResponse = jsonDecode(response.body);
        print('AAAAAAAAAAA ${response.body}');
        final parsedData =
            jsonDecode(response.body).cast<Map<String, dynamic>>();
        final res =
            parsedData.map<Message>((json) => Message.fromJson(json)).toList();
        print('AAAAAAAAAAA $res');
        return [
          Message(
              id: "1",
              text: "aaaaaaaa",
              publicationDate: "1",
              senderUser: SenderUser(id: "1", name: "name"))
        ];
      }
    } catch (e) {
      print(e);
    }
    return List.from([
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
      Message(
        id: "1",
        text: "テキストです",
        publicationDate: "1",
        senderUser: SenderUser(id: "1", name: "name"),
      ),
    ]);
  }

  // // TODO: PUT /messages/:id/isRead
  // Future<Map<String, dynamic>?> readMessage(String id) async {
  //   final response = await http.put(
  //     Uri.parse(_baseUrl + "messages/$id/isRead"),
  //   );
  //   if (response.statusCode == 200) {
  //     final readMessageResponse = jsonDecode(response.body);
  //     return readMessageResponse;
  //   }
  // }

  // // TODO: PUT /users/is_publishing
  Future<Map<String, bool>?> changePublishingStatus(bool isPublishing) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String token = pref.get("token") as String;
    final response = await http.put(
      Uri.parse(_baseUrl + "users/is_publishing"),
      body: jsonEncode({"is_publishing": isPublishing}),
      headers: {
        // TODO: insert token
        HttpHeaders.authorizationHeader: token,
      },
    );
    if (response.statusCode == 200) {
      final readMessageResponse = jsonDecode(response.body);
      return readMessageResponse;
    }
  }
}
