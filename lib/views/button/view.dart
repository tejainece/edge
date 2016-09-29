part of edge.views;

class ButtonViewTemplate implements ViewTemplate {
  ButtonViewTemplate() {
    _el = new ButtonElement();
  }

  ButtonViewTemplate.withText(this._text) {
    _el = new ButtonElement();
    _el.text = _text;
  }

  String _text = "";

  String get text => _text;

  set text(String aNew) {
    if(aNew == _text) {
      return;
    }

    _text = aNew;
    update();
  }

  dynamic get onClick => _el.onClick;

  ButtonElement _el;

  @override
  ButtonElement get body => _el;

  @override
  void update() {
    _el.text = _text;
  }

  Stream<bool> get onNeedsRemount => null;

  void destroy() {
  }
}