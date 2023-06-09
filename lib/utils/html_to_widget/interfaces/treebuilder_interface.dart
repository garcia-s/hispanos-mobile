abstract class ITreeBuilder<T> {
  abstract final List<T> openElements;
  abstract final String? defaultNamespace;
}
