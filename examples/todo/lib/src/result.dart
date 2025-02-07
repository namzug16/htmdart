sealed class Result<O, E> {
  const Result();

  bool get isOk => switch (this) {
        Ok() => true,
        Err() => false,
      };

  O unwrap() => switch (this) {
        Ok(:final ok) => ok,
        Err(:final err) => throw Exception("Cannot unwrap ok of Err: $err"),
      };

  E unwrapErr() => switch (this) {
        Ok(:final ok) => throw Exception("Cannot unwrap err of Ok: $ok"),
        Err(:final err) => err,
      };
}

final class Ok<O, E> extends Result<O, E> {
  final O ok;

  const Ok(this.ok);
}

final class Err<O, E> extends Result<O, E> {
  final E err;

  const Err(this.err);
}
