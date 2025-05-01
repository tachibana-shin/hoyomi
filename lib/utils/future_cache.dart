class FutureCache<T> {
  final Future<T> future;
  T? data;
  dynamic error;

  FutureCache(this.future) {
    this.future.then((data) {
      this.data = data;
    }).catchError((error) {
      this.error = error;
    });
  }
}
