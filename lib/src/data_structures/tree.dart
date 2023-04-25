class Tree<E> {
  Tree({
    required this.element,
    this.children = const [],
  });

  E element;
  List<Tree<E>> children;

  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      children.fold(
          combine(initialValue, this.element),
          (acc, child) =>
              child.fold(combine(acc, child.element), (b, a) => combine(b, a)));

  Tree<T> map<T>(T Function(E element) morph) => Tree(
        element: morph(this.element),
        children:
            children.map((child) => child.map(morph)).toList(growable: false),
      );
}
