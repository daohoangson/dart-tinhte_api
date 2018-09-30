import 'package:test/test.dart';
import 'package:tinhte_api/tinhte_api.dart';

void main() {
  group('batch', () {
    Api api;
    setUp(() => api = new Api('https://xfrocks.com/api/index.php', '', ''));
    tearDown(() => api.close());

    test('does nothing if no fetches', () async {
      final requestCountBefore = api.requestCount;
      final batch = api.newBatch();
      final fetched = await batch.fetch();
      expect(fetched, equals(false));
      expect(api.requestCount, equals(requestCountBefore));
    });

    test('sends all requests at once', () async {
      final requestCountBefore = api.requestCount;
      final batch = api.newBatch();
      getPostById(api, 4)
          .then(expectAsync1((Post post) => expect(post.id, equals(4))));
      getPostById(api, 5)
          .then(expectAsync1((Post post) => expect(post.id, equals(5))));
      final fetched = await batch.fetch();
      expect(fetched, equals(true));
      expect(api.requestCount - requestCountBefore, equals(1));
    });
  });
}
