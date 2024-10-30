sealed class PatternState<T extends Object?> {}

class Initial<T extends Object?> extends PatternState<T> {}

class Loading<T extends Object?> extends PatternState<T> {}

class Success<T extends Object?> extends PatternState<T> {
  Success({this.data});

  final T? data;
}

class Fail<T extends Object?> extends PatternState<T> {
  Fail({required this.error, required this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;
}

String getState(PatternState<String> state) {
  return switch (state) {
    Initial() => 'Initial',
    Loading() => 'Loading',
    Success(:final data) => 'Success: $data',
    Fail(:final error, :final stackTrace) => 'Fail: $error, $stackTrace',
  };
}
