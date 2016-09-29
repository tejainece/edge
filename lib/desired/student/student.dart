library component;

import 'dart:async';
import 'dart:html';

import 'package:edge/meta/meta.dart';
import 'package:edge/views/views.dart';

import 'package:edge/models/student.dart';

@Template(const ContainerView(const <View>[
  const TextView(text: const Bind<String>("student.name")),
  const TextView(text: const Bind<String>("student.place")),
  const ButtonView(
      text: const Value<String>('Print'),
      onClick: const Output<dynamic>('onPrint')),
]))
class StudentView implements View {
  const StudentView({this.student, this.onPrint});

  final Property<Student> student;

  @OutputRedirect()
  final Output<dynamic> onPrint;
}

class StudentViewTemplate implements ViewTemplate {
  StudentViewTemplate() {
    _el.children.add(_nameTemplate.body);
    _el.children.add(_ageTemplate.body);
    _el.children.add(_printTemplate.body);

    _printTemplate.text = 'Print';

    if (_nameTemplate.onNeedsRemount != null) {
      _childRemountCancellers.add(_nameTemplate.onNeedsRemount.listen((_) {
        _el.children[0] = _nameTemplate.body;
      }));
    }

    if (_ageTemplate.onNeedsRemount != null) {
      _childRemountCancellers.add(_ageTemplate.onNeedsRemount.listen((_) {
        _el.children[1] = _nameTemplate.body;
      }));
    }
  }

  List<StreamSubscription> _childRemountCancellers =
      new List<StreamSubscription>();

  Student _student;

  Student get student => _student;

  set student(Student aNew) {
    _student = aNew;
    update();
  }

  Stream<dynamic> get onPrint => _printTemplate.onClick;

  TextViewTemplate _nameTemplate = new TextViewTemplate();

  TextViewTemplate _ageTemplate = new TextViewTemplate();

  ButtonViewTemplate _printTemplate = new ButtonViewTemplate();

  DivElement _el = new DivElement();

  void update() {
    _nameTemplate.text = student.name;
    _ageTemplate.text = student.place;
  }

  DivElement get body => _el;

  Stream<bool> get onNeedsRemount => null;

  void destroy() {
    //TODO cancel needs update streamSubscriptions!
  }
}
