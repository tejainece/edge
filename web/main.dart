// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:edge/edge.dart' as edge;
import 'package:edge/desired/component.dart';

void main() {
  edge.mount(querySelector('#output'), new StudentAppComponent());
}
