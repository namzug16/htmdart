//
// ignore_for_file: unintended_html_in_doc_comment

import "dart:convert";

import "package:htmdart/src/hx_events.dart";
import "package:htmdart/src/hx_swap.dart";
import "package:htmleez/htmleez.dart";

//
//ignore: camel_case_types
final class $hx {
  const $hx._();

  static final events = HxEvents();

  /// Automatically sets the hx-{Verb} and path for the given handler
  // static HTML handle(Function handler, {List<String>? pathParameters, Map<String, String>? queryParameters}) {
  //   final mp = PathRegistry().getMethodAndPath(handler);
  //
  //   String path = mp.$2;
  //
  //   if (pathParameters != null) {
  //     int index = 0;
  //     path = path.replaceAllMapped(RegExp(r":\w+"), (match) {
  //       if (index < pathParameters.length) {
  //         return pathParameters[index++];
  //       }
  //       throw ArgumentError.value(path, "path parameters", "missing parameters. $pathParameters");
  //     });
  //   }
  //
  //   if (queryParameters != null) {
  //     path = Uri(path: path, queryParameters: queryParameters).toString();
  //   }
  //
  //   return switch (mp.$1) {
  //     "GET" => $hx.get(path),
  //     "POST" => $hx.post(path),
  //     "PUT" => $hx.put(path),
  //     "DELETE" => $hx.delete(path),
  //     "PATCH" => $hx.patch(path),
  //     _ => throw ArgumentError.value(mp.$1, "verb", "not a valid HTMX verb"),
  //   };
  // }

  /// Issues a GET request to the specified URL
  static const get = Attribute("hx-get");

  /// Issues a POST request to the specified URL
  static const post = Attribute("hx-post");

  /// Issues a PUT request to the specified URL
  static const put = Attribute("hx-put");

  /// Issues a PATCH request to the specified URL
  static const patch = Attribute("hx-patch");

  /// Issues a DELETE request to the specified URL
  static const delete = Attribute("hx-delete");

  /// Pushes a URL into the browser location bar to create history
  static const pushUrl = Attribute("hx-push-url");

  /// Selects content to swap in from a response
  static const select = Attribute("hx-select");

  /// Selects content to swap in from a response, somewhere other than the target (out of band)
  static const selectOob = Attribute("hx-select-oob");

  /// Controls how content will swap in (outerHTML, beforeend, afterend, etc.)
  static final swap = HxSwap();

  /// Marks element to swap in from a response (out of band)
  static final swapOob = HxSwap.oob();

  /// Specifies the target element to be swapped
  static const target = Attribute("hx-target");

  /// Specifies the event that triggers the request
  static const trigger = Attribute("hx-trigger");

  /// Adds values to submit with the request (in JSON format)
  static const vals = Attribute("hx-vals");

  /// Adds values to submit with the request (in JSON format)
  /// Accepts a Map<String, dynamic> that then will be encoded to json
  static HTML valsMap(Map<String, dynamic> vals) => const Attribute("hx-vals")(jsonEncode(vals));

  /// Adds progressive enhancement for links and forms
  static const boost = Attribute("hx-boost");

  /// Shows a confirm() dialog before issuing a request
  static const confirm = Attribute("hx-confirm");

  /// Disables HTMX processing for the given node and any child nodes
  static const disable = Attribute("hx-disable");

  /// Adds the disabled attribute to specified elements while a request is in flight
  static const disabledElt = Attribute("hx-disabled-elt");

  /// Controls and disables automatic attribute inheritance for child nodes
  static const disinherit = Attribute("hx-disinherit");

  /// Changes the request encoding type
  static const encoding = Attribute("hx-encoding");

  /// Specifies extensions to use for this element
  static const ext = Attribute("hx-ext");

  /// Adds custom headers to be submitted with the request
  static const headers = Attribute("hx-headers");

  /// Prevents sensitive data from being saved to the history cache
  static const history = Attribute("hx-history");

  /// Specifies the element to snapshot and restore during history navigation
  static const historyElt = Attribute("hx-history-elt");

  /// Includes additional data in requests
  static const include = Attribute("hx-include");

  /// Specifies the element to apply the htmx-request class to during a request
  static const indicator = Attribute("hx-indicator");

  /// Controls and enables automatic attribute inheritance for child nodes if it has been disabled by default
  static const inherit = Attribute("hx-inherit");

  /// Filters the parameters that will be submitted with a request
  static const params = Attribute("hx-params");

  /// Specifies elements to keep unchanged between requests
  static const preserve = Attribute("hx-preserve");

  /// Shows a prompt() dialog before submitting a request
  static const prompt = Attribute("hx-prompt");

  /// Replaces the URL in the browser location bar
  static const replaceUrl = Attribute("hx-replace-url");

  /// Configures various aspects of the request
  static const request = Attribute("hx-request");

  /// Controls how requests made by different elements are synchronized
  static const sync = Attribute("hx-sync");

  /// Forces elements to validate themselves before a request
  static const validate = Attribute("hx-validate");

  /// Adds values dynamically to the parameters to submit with the request (deprecated, use hx-vals)
  static const vars = Attribute("hx-vars");
}

///HTMX Header reference
final class HX {
  const HX._();
  //NOTE: Request reference

  ///indicates that the request is via an element using hx-boost
  static const boosted = "HX-Boosted";

  ///the current URL of the browser
  static const currentURL = "HX-Current-URL";

  ///“true” if the request is for history restoration after a miss in the local history cache
  static const historyRestoreRequest = "HX-History-Restore-Request";

  ///the user response to an hx-prompt
  static const prompt = "HX-Prompt";

  ///always “true”
  static const request = "HX-Request";

  ///the id of the target element if it exists
  static const target = "HX-Target";

  ///the name of the triggered element if it exists
  static const triggerName = "HX-Trigger-Name";

  ///On Request: the id of the triggered element if it exists
  ///On Response: allows you to trigger client-side events
  static const trigger = "HX-Trigger";

  //NOTE: Response reference

  ///allows you to do a client-side redirect that does not do a full page reload
  static const location = "HX-Location";

  ///pushes a new url into the history stack
  static const pushUrl = "HX-Push-Url";

  ///can be used to do a client-side redirect to a new location
  static const redirect = "HX-Redirect";

  ///if set to “true” the client-side will do a full refresh of the page
  static const refresh = "HX-Refresh";

  ///replaces the current URL in the location bar
  static const replaceUrl = "HX-Replace-Url";

  ///allows you to specify how the response will be swapped. See hx-swap for possible values
  static const reswap = "HX-Reswap";

  ///a CSS selector that updates the target of the content update to a different element on the page
  static const retarget = "HX-Retarget";

  ///a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing hx-select on the triggering element
  static const reselect = "HX-Reselect";

  ///allows you to trigger client-side events after the settle step
  static const triggerAfterSettle = "HX-Trigger-After-Settle";

  ///allows you to trigger client-side events after the swap step
  static const triggerAfterSwap = "HX-Trigger-After-Swap";
}
