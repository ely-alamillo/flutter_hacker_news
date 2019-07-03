import 'dart:convert';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final res = await client.get('$_root/topstories.json');
    final ids = json.decode(res.body);

    return ids;
  }

  fetchItem(int id) async {
    final res = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(res.body);
    return ItemModel.fromJson(parsedJson);
  }
}
