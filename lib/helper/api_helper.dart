import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:singlton_api_call_app/models/post.dart';

class APIHelper {
  // 1. create a private named constructor
  APIHelper._();

  //2. create an object with  the help of private named constructor
  static final APIHelper apiHelper = APIHelper._();

  final String baseURL = "https://jsonplaceholder.typicode.com";
  final String endPoint = "/posts/99";

  Future<Post?> fetchSinglePostData() async {
    http.Response res = await http.get(
      Uri.parse(baseURL + endPoint),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      Post post = Post.fromJson(json: decodedData);
      return post;
    }
    return null;
  }
}
