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

    test('deletes ok', () {
      const url = 'https://httpbin.org/delete';
      api
          .deleteJson(url)
          .then(expectAsync1((json) => expect(json['url'], equals(url))));
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

    test('puts ok', () {
      const url = 'https://httpbin.org/put';
      api
          .putJson(url)
          .then(expectAsync1((json) => expect(json['url'], equals(url))));
    });
  });
}
