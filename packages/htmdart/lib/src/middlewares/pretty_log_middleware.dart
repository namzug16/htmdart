import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:stack_trace/stack_trace.dart';

Middleware prettyLogMiddleware() => (innerHandler) {
      return (request) {
        final startTime = DateTime.now();
        final watch = Stopwatch()..start();

        return Future.sync(() => innerHandler(request)).then((response) {
          final (method, requestedUri, elapsed) = _formatRequestData(request, watch);

          final msg = _message(
            startTime,
            response.statusCode,
            requestedUri,
            method,
            elapsed,
          );

          _defaultLogger(msg, false);

          return response;
        }, onError: (Object error, StackTrace stackTrace) {
          if (error is HijackException) throw error;

          final (method, requestedUri, elapsed) = _formatRequestData(request, watch);

          final msg = _errorMessage(
            startTime,
            requestedUri,
            method,
            elapsed,
            error,
            stackTrace,
          );

          _defaultLogger(msg, true);

          // ignore: only_throw_errors
          throw error;
        });
      };
    };

(String, String, String) _formatRequestData(Request r, Stopwatch w) {
  String method = " ${r.method} ";
  method = _bgC(method);

  String requestedUri = _m('${r.requestedUri.path}${_formatQuery(r.requestedUri.query)}');

  String elapsed = _formatElapsedDuration(w.elapsed);

  return (method, requestedUri, elapsed);
}

String _formatElapsedDuration(Duration d) {
  late String res;
  if (d.inSeconds.floor() > 0) {
    res = "${d.inSeconds} s";
  } else if (d.inMilliseconds.floor() > 0) {
    res = "${d.inMilliseconds} ms";
  } else {
    res = "${d.inMicroseconds} μs";
  }

  return _c(res);
}

String _formatQuery(String query) {
  return query == '' ? '' : '?$query';
}

String _message(
  DateTime requestTime,
  int statusCode,
  String requestedUri,
  String method,
  String elapsedTime,
) {
  final sc0 = " $statusCode ";
  final sc = switch (statusCode) {
    < 300 => _bgG(sc0),
    < 400 => _bgB(sc0),
    < 500 => _bgY(sc0),
    _ => _bgR(sc0),
  };

  return '${requestTime.toIso8601String()} ${elapsedTime.padLeft(17)}  -  ${method.padRight(25)} -  $sc  -  $requestedUri';
}

String _errorMessage(
  DateTime requestTime,
  String requestedUri,
  String method,
  String elapsedTime,
  Object error,
  StackTrace? stack,
) {
  var chain = Chain.current();
  if (stack != null) {
    chain = Chain.forTrace(stack).foldFrames((frame) => frame.isCore || frame.package == 'shelf').terse;
  }

  var msg = '$requestTime\t$elapsedTime\t$method\t$requestedUri'
      '\n\n${_r("===================================")}\n'
      '${_r(error.toString())}'
      '\n${_r("===================================")}\n';

  return '$msg\n${_r(chain.toString())}';
}

void _defaultLogger(String msg, bool isError) {
  if (isError) {
    print('${_bgR("[ERROR]")} $msg');
  } else {
    print(msg);
  }
}

const _ansiEscape = "\x1B[";

const _ansiReset = "${_ansiEscape}0m";

String _ansiSequence(String codes, String text) => "$_ansiEscape${codes}m$text$_ansiReset";

String _bgR(String text) => _ansiSequence("1;101;37", text);
String _bgG(String text) => _ansiSequence("1;102;30", text);
String _bgY(String text) => _ansiSequence("1;103;30", text);
String _bgB(String text) => _ansiSequence("1;104;37", text);
String _bgC(String text) => _ansiSequence("1;106;30", text);

String _r(String text) => _ansiSequence("91", text);
String _m(String text) => _ansiSequence("95", text);
String _c(String text) => _ansiSequence("96", text);
