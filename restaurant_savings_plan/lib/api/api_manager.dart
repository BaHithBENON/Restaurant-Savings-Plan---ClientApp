import 'dart:convert';

import 'api_response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static final userData = GetStorage();
  static var headerContent = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
    // 'Authorization': "${userData.read('token_type')} ${userData.read('access_token')}",

  // Places
  // "status":"success",
  // "data":[{"id":1,"text":"Avlekete"},{"id":2,"text":"Bocossi-tokpa"}],
  // "message":"All places retrieved"

  // Alerts
  // "status":"success",
  // "data":[{"info":60,"type":"Message","titre":"Hygiène de l'eau",
  //          "texte":"<p>Hygiène de leau :\nIl ne faut jamais utiliser les mains pour boire directement leau sous le
  //          robinet\nafin déviter les contaminations.</p>",
  //          "id":1046,"debut":"2022-06-30T00:00:00.000Z","fin":"2022-07-01T00:00:00.000Z","quartier":17}],
  // "message":"Relevant alerts retrieved"

  // Posts
  // "status":"success",
  // "data":[
  //  {"id":129,"titre":"RIPOSTE CONTRE L’EPIDEMIE DE CHOLERA AU BENIN",
  //  "cover":"https://sac-tic.s3.amazonaws.com/d3f137a4-3132-45f8-b054-c0d30aa1a939.jpg"
  //  ,"categorie":"Hygiène","motscles":"","texte": ".............",
  //  "created_at":"2019-08-07T12:28:28.489Z","updated_at":"2021-06-06T17:32:18.832Z","brouillon":false,"validateurid":2}
  // }],
  // "message":"Relevant posts retrieved"

  static Future<dynamic> apiRequest(var requestUrl, var method,
      {var header = false, var data}) async {
    var url = Uri.parse(requestUrl);
    var body = header ? jsonEncode(data) : data;
    var res;
    switch (method) {
      case 'GET':
        res = await http.get(url, headers: header ? headerContent : null);
        break;
      case 'POST':
        res = await http.post(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PUT':
        res = await http.put(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PATCH':
        res = await http.patch(url, headers: header ? headerContent : null, body: body);
        break;
      case 'DELETE':
        res = await http.delete(url, headers: header ? headerContent : null);
        break;
      default:
    }
    // print(res);
    return ApiResponse.toResponse(res);
  }
}
