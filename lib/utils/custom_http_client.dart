import 'package:http/http.dart';

class CustomHttpClient{
  final String _baseURL;
  final Client _client;

  CustomHttpClient(this._baseURL, this._client);
}