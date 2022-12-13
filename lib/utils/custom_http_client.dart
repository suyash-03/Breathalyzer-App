import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'constants.dart';
import 'failure.dart';

class CustomHttpClient{
  final String _baseURL;
  final Client _client;

  CustomHttpClient(this._baseURL, this._client);

  Future<Map<String, dynamic>> getMiscData(String path) async {
    try {
      var response = await _client.get(Uri.parse(miscUrl + path));
      if (response.statusCode != 200) throw Failure('error occurred $response');
      return json.decode(response.body);
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }
}