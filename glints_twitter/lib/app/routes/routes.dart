
import 'package:flutter/widgets.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:glints_twitter/login/login.dart';
import 'package:glints_twitter/tweet/tweet.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:
      return [TweetPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}