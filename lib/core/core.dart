library edge.core;

import 'dart:html';
import 'package:edge/meta/meta.dart';

mount(Element aEl, ViewTemplate aComponent) {
  aEl.children.add(aComponent.body);
}