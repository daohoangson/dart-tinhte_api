import 'dart:convert';
import 'package:http/http.dart' as http;

http.Response throwExceptionOnError(http.Response response) {
  if (response.statusCode < 400) {
    return response;
  }

  Map j = json.decode(response.body);
  if (j.containsKey('error_description')) {
    throw new Exception(j['error_description']);
  }
  if (j.containsKey('errors')) {
    List<String> errors = j['errors'];
    throw new Exception(errors.join(', '));
  }

  throw new Exception('Unknown error');
}
