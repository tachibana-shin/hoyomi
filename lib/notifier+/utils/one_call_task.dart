typedef Noop = void Function();
Noop oneCallTask(Noop callback) {
  Future<void>? microtask;

  return () {
    if (microtask != null) return;
    microtask = Future.microtask(callback).whenComplete(() => microtask = null);
  };
}
