import 'dart:async';
import 'dart:convert';
import 'package:API_Tutorial_Flutter/Model/GetUsers.dart';
import 'package:http/http.dart' as http;

class SERVER{

//  String serverUrl = "http://restcountries.eu/rest/v2/all";


  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<GetUsers>> fetchJSONData() async {

    var jsonResponse = await http.get(apiURL);
    if (jsonResponse.statusCode == 200) {
      final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();
      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }



  Future<dynamic> getStatusData(int id) async {
   // await Future.delayed(const Duration(milliseconds: 3500));
    var myUrl = "$apiURL/$id";
     var status =  await http.get(myUrl  );
    if (status.statusCode == 200) {
      var result = json.decode(status.body);
      return result;
    } else {
      throw Exception('Failed to load data from internet');
    }

  }



















  // Future<List> getData() async{
  //   String myUrl = "$serverUrl";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json'
  //       });
  //   return json.decode(response.body);
  // }
  //



}