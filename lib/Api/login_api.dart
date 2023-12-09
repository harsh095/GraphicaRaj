import 'dart:convert';
import 'package:graphica_raj/Model/get_post.dart';
import 'package:graphica_raj/Model/login_model.dart';
import 'package:graphica_raj/utils/api_url.dart';
import 'package:http/http.dart' as http;


class LoginApi {
  Future<LoginModel> Login(String mobile) async {

    var response = await http.post(Uri.parse(login_url),
        body: ({
          'mobile': mobile.toString(),
        }),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        });
    Encoding.getByName('utf-8');
    Map<String, dynamic> map = await jsonDecode(response.body);
    print(response.body);
    final data = LoginModel.fromJson(map);
    return data;
  }
}