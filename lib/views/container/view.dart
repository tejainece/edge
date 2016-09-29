part of edge.views;

class ContainerView implements View {
  const ContainerView(this.views);

  final List<View> views;
}