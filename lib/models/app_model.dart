import 'package:http/http.dart' as http;
import 'dart:convert';

class DataModel {
  final String title;

  DataModel({required this.title});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(title: json['title']);
  }
}

class ApiService {
  Future<DataModel> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
