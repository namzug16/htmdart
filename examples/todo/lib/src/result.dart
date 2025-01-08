sealed class Result<O, E> {
  const Result();
}

final class Ok<O, E> extends Result<O, E> {
  final O ok;

  const Ok(this.ok);
}

final class Err<O, E> extends Result<O, E> {
  final E err;

  const Err(this.err);
}
