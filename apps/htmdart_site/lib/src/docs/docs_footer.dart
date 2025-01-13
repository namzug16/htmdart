import 'package:htmdart/htmdart.dart';

HTML docsFooter(
  (String, String)? previous,
  (String, String)? next,
) =>
    div([
      hx.boost("true"),
      classes([
        "join grid pt-4",
        if (previous != null && next != null) "grid-cols-2",
      ]),
      if (previous != null)
        a([
          href(previous.$1),
          className("join-item btn btn-outline"),
          classes([
            if (next != null) "join-item",
            "btn btn-outline",
          ]),
          "Previous . ${previous.$2}".p,
        ]),
      if (next != null)
        a([
          href(next.$1),
          classes([
            if (previous != null) "join-item",
            "btn btn-outline",
          ]),
          "Next . ${next.$2}".p,
        ]),
    ]);
