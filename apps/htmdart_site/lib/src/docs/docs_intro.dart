import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/info_alert.dart';

final docsIntro = [
  "Introduction".h2,
  "Htmdart is a pure dart shelf toolkit that helps you build interactive websites and web applications"
      .p,
  "The Htmdart toolkit consists of two main packages:".p,
  "Htmleez".h4,
  "Htmleez helps you build HTML in a dynamic and straightfoward way by using 100% pure dart functions"
      .p,
  "and".p,
  "Htmdart".h4,
  p([
    "Which adds helper functions and extensions to ".span,
    ("Shelf", "https://pub.dev/packages/shelf").a,
    " to help you work with Htmx".span,
  ]),
  p([
    "We also offer a ".span,
    ("translator", "/translator").a,
    " that helps you migrate from html to htmleez".span,
  ]),
  infoAlert(
    p([
      "If you are new to Htmx I would recommend you to start by reading ".span,
      ("the official docs", "https://htmx.org/docs/").a,
      " and ".span,
      ("when to use htmx", "https://htmx.org/essays/when-to-use-hypermedia/").a,
      " to have a better idea on how htmdart can help you".span,
    ]),
  ),
];
