import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        // implicit return when using await
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}
