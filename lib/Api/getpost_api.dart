import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:graphica_raj/Model/get_post.dart';

import '../utils/api_url.dart';

class GetPostApi {
  Future<GetPostModel> data(String page) async {
    print(GetPostUrl+page);
    var response = await http.get(Uri.parse(GetPostUrl+page),);

    print(response.statusCode.toString());
    Map<String, dynamic> map = await jsonDecode(response.body);
    print("Ads data listing");
    print(response.body);

    final data = GetPostModel.fromJson(map);
    return data;
  }


}