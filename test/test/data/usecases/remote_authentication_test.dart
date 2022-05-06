import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

import 'package:flutter_clean_arch_tdd/data/http/http.dart';
import 'package:flutter_clean_arch_tdd/data/usecases/usecases.dart';
import 'package:flutter_clean_arch_tdd/domain/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct values', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);

    verify(httpClient.request(url: url, method: 'post', body: {
      'email': params.email,
      'password': params.secret,
    }));
  });
}
