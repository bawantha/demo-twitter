// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:glints_twitter/tweet/tweet.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App(
        glintsTwitterAuth: GlintsTwitterAuth(),
      ));
      expect(find.byType(TweetPage), findsOneWidget);
    });
  });
}
