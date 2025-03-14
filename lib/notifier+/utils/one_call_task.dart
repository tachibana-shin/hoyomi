void log() {
  print("emit change");
}

Future<void>? promise;
void emit() {
  if (promise != null) return;
}

void main() {
  emit();
  emit();
  emit();
  emit();
}

typedef Noop = void Function();
Noop oneCallTask(Noop callback) {
  Future<void>? microtask;

  return () {
    if (microtask != null) return;
    microtask = Future.microtask(callback).whenComplete(() => microtask = null);
  };
}
