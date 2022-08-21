// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:glints_twitter/bootstrap.dart';

void main() {
  bootstrap(() =>  App(glintsTwitterAuth: GlintsTwitterAuth(),));
}
