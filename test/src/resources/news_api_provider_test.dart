import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:hacker_news/src/resources/news_api_provider.dart';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();

    // mock client
    newsApi.client = MockClient((request) async {
      final List<int> testIds = [1, 2, 3, 4];
      return Response(json.encode(testIds), 200);
    });

    final ids = await newsApi.fetchTopIds();

    prefix0.expect(ids, [1, 2, 3, 4]);
  });

  test('fetchItem returns an itemModel', () async {
    final newsApi = NewsApiProvider();

    // mock client
    newsApi.client = MockClient((request) async {
      final testItem = {'id': 01234};
      return Response(json.encode(testItem), 200);
    });

    final item = await newsApi.fetchItem(456);

    prefix0.expect(item.id, 01234);
  });
}
