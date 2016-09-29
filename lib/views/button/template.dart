part of edge.views;

class ButtonView implements View {
  const ButtonView({this.text, this.onClick});

  final Property<String> text;

  final Output<dynamic> onClick;
}