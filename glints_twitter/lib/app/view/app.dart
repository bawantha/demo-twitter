// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/app/app.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required GlintsTwitterAuth glintsTwitterAuth,
  }) : _glintsTwitterAuth = glintsTwitterAuth;

  final GlintsTwitterAuth _glintsTwitterAuth;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _glintsTwitterAuth,
      child: BlocProvider(
        create: (_) => AppBloc(
          glintsTwitterAuth: _glintsTwitterAuth,
        ),
        child: const AppView(),
      ),
    );
  }
}


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
