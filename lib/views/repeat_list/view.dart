part of edge.views;

class RepeatListView<V, T> implements View {
  const RepeatListView(this.loopedView, this.loopedList);

  final dynamic loopedView;

  final String loopedList;
}