import 'dart:io';

import 'package:htmdart/htmdart.dart';
import 'package:markdown/markdown.dart';

Future<HTML> fromMarkdown(String path) async {
  final file = File(path);

  if (!await file.exists()) {
    return span(["Static markdown file could not be found. $path".t]);
  }

  final mdContent = await file.readAsString();

  final htmlContent = markdownToHtml(mdContent);

  return UnsafeRaw(htmlContent);
}
