library edge.annotations;

import 'dart:async';

abstract class View {}

class Template {
  const Template(this.root);

  final View root;
}

class Output<T> {
  const Output(this.name);

  final String name;
}

class OutputRedirect {
  const OutputRedirect();
}

class OutputCallback {
  const OutputCallback();
}

abstract class Property<T> {
  String get value;
}

class Value<T> implements Property<T> {
  const Value(this.value);

  final String value;
}

class Bind<T> implements Property<T> {
  const Bind(this.value);

  final String value;
}

abstract class ViewTemplate implements View {
  dynamic get body;

  void update();

  Stream<bool> get onNeedsRemount;

  void destroy();
}

/*
class Component {
  const Component(this.viewTemplate);

  final Type viewTemplate;
}

abstract class ComponentMixin {
  ViewTemplate view;

  dynamic get body => view.body;

  void update() {
    view.update();
  }

  Stream<bool> get onNeedsRemount => view.onNeedsRemount;

  void destroy() {
    view.destroy();
  }
}
*/