library component;

import 'dart:html';
import 'dart:async';

import 'package:edge/meta/meta.dart';
import 'package:edge/views/views.dart';
import 'package:edge/models/student.dart';
import 'package:edge/desired/student/student.dart';

/*
@Template(const ContainerView(const <View>[
  const TextView(const Bind<String>("index")),
  const TextView(const Bind<String>("student.name")),
  const TextView(const Bind<String>("student.dob.toString()")),
]))
class StudentItemView implements View {
  const StudentItemView(this.student, this.index);

  final Property<Student> student;

  final Property<int> index;
}

@Template(const ForListView(
    const StudentItemView(
        const Bind<Student>('item'), const Bind<int>('index')),
    'students'))
class StudentListView implements View {
  StudentListView(this.students);

  final Property<List<Student>> students;
}
*/

/*
class StudentListComponent implements Component {
  final List<Student> students = const <Student>[
    const Student('Teja', 'Stockholm')
  ];

  StudentViewTemplate view;
}
*/

@Template(const StudentView(
    student: const Bind<Student>('student'),
    onPrint: const Output<dynamic>('onPrint')))
class StudentApp {
  StudentApp() {}

  final Student student = const Student('Teja', 'Stockholm');

  @OutputCallback()
  onPrint(dynamic) {
    print("Print requested!");
  }
}

class StudentAppComponent implements ViewTemplate {
  StudentAppComponent() {
    _el.children.add(_studentTemplate.body);

    if (_studentTemplate.onNeedsRemount != null) {
      _studentTemplate.onNeedsRemount.listen((_) {
        _el.children[0] = _studentTemplate.body;
      });
    }

    _studentTemplate.student = student;

    _studentTemplate.onPrint.listen((arg) {
      onPrint(arg);
    });
  }

  final Student student = const Student('Teja', 'Stockholm');

  onPrint(dynamic) {
    print("Print requested!");
  }

  StudentViewTemplate _studentTemplate = new StudentViewTemplate();

  DivElement _el = new DivElement();

  DivElement get body => _el;

  void update() {
    _studentTemplate.student = student;
  }

  Stream<bool> get onNeedsRemount => null;

  void destroy() {
    //TODO destroy children
  }
}
