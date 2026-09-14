//
// ignore_for_file: unintended_html_in_doc_comment

import "package:htmleez/src/attribute.dart";
import "package:htmleez/src/html_component.dart";

/// Creates an [Attribute] with the given [name].
///
/// Shorthand helper for `Attribute(name)`.
Attribute $(String name) => Attribute(name);

/// Creates an [RawAttribute] with the given [name].
///
/// Shorthand helper for `RawAttribute(name)`.
RawAttribute raw$(String name) => RawAttribute(name);

/// $("class") attribute that accepts multiple classes
HtmlComponent $classes(List<String> classes) => const Attribute("class")(classes.isNotEmpty ? classes.reduce((a, b) => "$a $b") : "");
