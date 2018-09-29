import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'internal/http.dart';
import 'model/oauth_token.dart';

class Api {
  final String _apiRoot;
  final String _clientId;
  final String _clientSecret;

  final Client _httpClient = new Client();
  final Map<String, String> _httpHeaders = new Map();
  Response _httpLatestResponse;

  Api(String apiRoot, this._clientId, this._clientSecret)
      : _apiRoot = apiRoot.replaceAll(new RegExp(r'/$'), '');

  String buildUrl(String path) {
    if (path.startsWith('http')) {
      return path;
    }

    final safePath = path.replaceFirst('?', '&');

    return "${this._apiRoot}?${safePath}";
  }

  close() {
    _httpClient.close();
  }

  Response getLatestResponse() {
    return _httpLatestResponse;
  }

  Future<OauthToken> login(String username, String password) async {
    final response = await postJson('oauth/token', body: {
      "grant_type": "password",
      "client_id": _clientId,
      "client_secret": _clientSecret,
      "username": username,
      "password": password,
    });

    return OauthToken.fromJson(response);
  }

  Future<OauthToken> refreshToken(String refreshToken) async {
    final response = await postJson('oauth/token', body: {
      "grant_type": "refresh_token",
      "client_id": _clientId,
      "client_secret": _clientSecret,
      "refresh_token": refreshToken,
    });

    return OauthToken.fromJson(response);
  }

  Future<dynamic> postJson(path,
      {Map<String, String> body, checkError = true}) async {
    final url = buildUrl(path);
    _httpLatestResponse =
        await _httpClient.post(url, body: body, headers: _httpHeaders);
    if (checkError) {
      throwExceptionOnError(_httpLatestResponse);
    }

    return json.decode(_httpLatestResponse.body);
  }
}
