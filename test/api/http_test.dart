import 'package:test/test.dart';
import 'package:tinhte_api/tinhte_api.dart';

void main() {
  group('http', () {
    Api api;
    setUp(() {
      api = new Api('', '', '');
    });

    tearDown(() {
      api.close();
    });

    test('gets ok', () {
      const url = 'https://httpbin.org/get';
      api
          .getJson(url)
          .then(expectAsync1((json) => expect(json['url'], equals(url))));
    });

    test('posts ok', () {
      const url = 'https://httpbin.org/post';
      api
          .postJson(url)
          .then(expectAsync1((json) => expect(json['url'], equals(url))));
    });
  });
}
