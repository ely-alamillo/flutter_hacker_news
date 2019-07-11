import 'dart:convert';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/repository.dart';
import 'package:http/http.dart' show Client;

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final res = await client.get('$_root/topstories.json');
    final ids = json.decode(res.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final res = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(res.body);
    return ItemModel.fromJson(parsedJson);
  }
}
