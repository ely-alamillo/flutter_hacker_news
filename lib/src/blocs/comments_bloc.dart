import 'package:hacker_news/src/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CommentsBloc {
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  // stream getters
  Observable<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

  // sink getter
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
