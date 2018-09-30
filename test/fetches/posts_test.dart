import 'package:test/test.dart';
import 'package:tinhte_api/tinhte_api.dart';

void main() {
  group('batch', () {
    Api api;
    setUp(() => api = new Api('https://xfrocks.com/api/index.php', '', ''));
    tearDown(() => api.close());

    test('gets post by id', () async {
      final post = await getPostById(api, 4);
      expect(post.id, equals(4));
    });
  });
}
