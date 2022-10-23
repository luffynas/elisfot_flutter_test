// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:elisoft_flutter_test/app.dart';
import 'package:elisoft_flutter_test/bootstrap.dart';

void main() {
  // ignore: omit_local_variable_types

  // bootstrap(
  //   () => DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (ctx) => App(),
  //   ),
  // );
  bootstrap(App.new);
}
