import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';

import 'model/oauth_token.dart';

part 'internal/api.dart';

class Api {
  final String _apiRoot;
  final String _clientId;
  final String _clientSecret;

  final Client _httpClient = new Client();
  final Map<String, String> _httpHeaders = new Map();

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
    return _latestResponse;
  }

  Future<OauthToken> login(String username, String password) async {
    final json = await postJson('oauth/token', bodyFields: {
      "grant_type": "password",
      "client_id": _clientId,
      "client_secret": _clientSecret,
      "username": username,
      "password": password,
    });

    return OauthToken.fromJson(json);
  }

  Future<OauthToken> refreshToken(String refreshToken) async {
    final json = await postJson('oauth/token', bodyFields: {
      "grant_type": "refresh_token",
      "client_id": _clientId,
      "client_secret": _clientSecret,
      "refresh_token": refreshToken,
    });

    return OauthToken.fromJson(json);
  }

  Future<dynamic> deleteJson(String path) {
    return sendRequest("DELETE", path, parseJson: true);
  }

  Future<dynamic> getJson(String path) {
    return sendRequest("GET", path, parseJson: true);
  }

  Future<dynamic> postJson(String path, {Map<String, String> bodyFields}) {
    return sendRequest("POST", path, bodyFields: bodyFields, parseJson: true);
  }

  Future<dynamic> putJson(String path, {Map<String, String> bodyFields}) {
    return sendRequest("PUT", path, bodyFields: bodyFields, parseJson: true);
  }

  Future<dynamic> sendRequest(String method, String path,
      {Map<String, String> bodyFields, String bodyJson, parseJson: false}) {
    return _sendRequest(_httpClient, method, buildUrl(path),
        bodyFields: bodyFields,
        bodyJson: bodyJson,
        headers: _httpHeaders,
        parseJson: parseJson);
  }
}
