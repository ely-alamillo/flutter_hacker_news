import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_bloc.dart';

import 'package:hacker_news/src/blocs/stories_provider.dart';
import 'package:hacker_news/src/widgets/news_list_tile.dart';
import 'package:hacker_news/src/widgets/refresh.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }
}

Widget buildList(StoriesBloc bloc) {
  return StreamBuilder(
    stream: bloc.topIds,
    builder: (context, AsyncSnapshot<List<int>> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Refresh(
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int idx) {
            bloc.fetchItem(snapshot.data[idx]);
            return NewsListTile(
              itemId: snapshot.data[idx],
            );
          },
        ),
      );
    },
  );
}
