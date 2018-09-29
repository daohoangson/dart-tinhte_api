import 'package:test/test.dart';
import 'package:tinhte_api/tinhte_api.dart';

void main() {
  group('oauth/token', () {
    Api api;
    const apiRoot = 'https://xfrocks.com/api/index.php';
    const clientId = 'gljf4391k3';
    const clientSecret = 'zw3lj0zox6be4z2';
    const username = 'api-tester';
    const email = 'api-tester@xfrocks.com';
    const password = '@pi-T3st3r';
    const userId = 2394;

    setUp(() {
      api = new Api(apiRoot, clientId, clientSecret);
    });

    tearDown(() {
      api.close();
    });

    group('grant_type=password', () {
      test('works with username/password', () {
        return api.login(username, password).then(
            expectAsync1((OauthToken t) => expect(t.userId, equals(userId))));
      });

      test('works with email/password', () {
        return api.login(email, password).then(
            expectAsync1((OauthToken t) => expect(t.userId, equals(userId))));
      });

      test('fails with wrong password', () {
        expect(api.login(username, 'xxx'), throwsException);
      });
    });

    group('grant_type=refresh_token', () {
      test('works', () {
        return api
            .login(username, password)
            .then((OauthToken t) => api.refreshToken(t.refreshToken))
            .then(expectAsync1(
                (OauthToken t) => expect(t.userId, equals(userId))));
      });
    });
  });
}
