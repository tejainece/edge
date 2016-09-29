part of edge.views;

class TextViewTemplate implements ViewTemplate {
  TextViewTemplate() {
    _el = new DivElement();
  }

  TextViewTemplate.withText(this._text) {
    _el = new DivElement();
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

  DivElement _el = new DivElement();

  @override
  DivElement get body => _el;

  @override
  void update() {
    _el.text = _text;
  }

  Stream<bool> get onNeedsRemount => null;

  void destroy() {
  }
}