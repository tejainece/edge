part of edge.views;

class ContainerViewTemplate implements ViewTemplate {
  ContainerViewTemplate() : _children = new List<ViewTemplate>() {}

  List<StreamSubscription> _childRemountCancellers =
      new List<StreamSubscription>();

  ContainerViewTemplate.withChildren(List<ViewTemplate> aChildren)
      : _children = new List<ViewTemplate>.from(aChildren, growable: false) {
    for (int cIdx = 0; cIdx < _children.length; cIdx++) {
      _el.children.add(_children[cIdx].body);

      ViewTemplate aChild = _children[cIdx];

      if (aChild.onNeedsRemount == null) {
        _childRemountCancellers.add(null);
      } else {
        _childRemountCancellers.add(aChild.onNeedsRemount.listen((_) {
          _el.children[cIdx] = _children[cIdx].body;
        }));
      }
    }
  }

  final List<ViewTemplate> _children;

  DivElement _el = new DivElement();

  @override
  DivElement get body => _el;

  @override
  void update() {
    _children.forEach((ViewTemplate aChild) {
      aChild.update();
    });
  }

  Stream<bool> get onNeedsRemount => null;

  void destroy() {
    //TODO cancel needs update streamSubscriptions!
  }
}
