import 'package:htmleez/htmleez.dart';

import 'constants.dart';

//ignore: camel_case_types
final class hx {
  /// Issues a GET request to the specified URL
  static final get = Attribute("hx-get");

  /// Issues a POST request to the specified URL
  static final post = Attribute("hx-post");

  /// Issues a PUT request to the specified URL
  static final put = Attribute("hx-put");

  /// Issues a PATCH request to the specified URL
  static final patch = Attribute("hx-patch");

  /// Issues a DELETE request to the specified URL
  static final delete = Attribute("hx-delete");

  /// Pushes a URL into the browser location bar to create history
  static final pushUrl = Attribute("hx-push-url");

  /// Selects content to swap in from a response
  static final select = Attribute("hx-select");

  /// Selects content to swap in from a response, somewhere other than the target (out of band)
  static final selectOob = Attribute("hx-select-oob");

  /// Controls how content will swap in (outerHTML, beforeend, afterend, etc.)
  static final swap = Attribute("hx-swap");

  /// Marks element to swap in from a response (out of band)
  static final swapOob = Attribute("hx-swap-oob");

  static final noSwap = swap(swapNone);

  static HTML oobSwap(
    HTML content, {
    String swap = swapTrue,
  }) {
    content.appendChild(swapOob(swap));
    return content;
  }

  static HTML oobSwapMany(List<HTML> content) {
    for (int i = 0; i < content.length; i++) {
      final e = content[i];
      e.appendChild(swapOob(swapTrue));
    }
    return HTMLSet(content);
  }

  /// Specifies the target element to be swapped
  static final target = Attribute("hx-target");

  /// Specifies the event that triggers the request
  static final trigger = Attribute("hx-trigger");

  /// Adds values to submit with the request (in JSON format)
  static final vals = Attribute("hx-vals");

  /// Adds progressive enhancement for links and forms
  static final boost = Attribute("hx-boost");

  /// Shows a confirm() dialog before issuing a request
  static final confirm = Attribute("hx-confirm");

  /// Disables HTMX processing for the given node and any child nodes
  static final disable = Attribute("hx-disable");

  /// Adds the disabled attribute to specified elements while a request is in flight
  static final disabledElt = Attribute("hx-disabled-elt");

  /// Controls and disables automatic attribute inheritance for child nodes
  static final disinherit = Attribute("hx-disinherit");

  /// Changes the request encoding type
  static final encoding = Attribute("hx-encoding");

  /// Specifies extensions to use for this element
  static final ext = Attribute("hx-ext");

  /// Adds custom headers to be submitted with the request
  static final headers = Attribute("hx-headers");

  /// Prevents sensitive data from being saved to the history cache
  static final history = Attribute("hx-history");

  /// Specifies the element to snapshot and restore during history navigation
  static final historyElt = Attribute("hx-history-elt");

  /// Includes additional data in requests
  static final include = Attribute("hx-include");

  /// Specifies the element to apply the htmx-request class to during a request
  static final indicator = Attribute("hx-indicator");

  /// Controls and enables automatic attribute inheritance for child nodes if it has been disabled by default
  static final inherit = Attribute("hx-inherit");

  /// Filters the parameters that will be submitted with a request
  static final params = Attribute("hx-params");

  /// Specifies elements to keep unchanged between requests
  static final preserve = Attribute("hx-preserve");

  /// Shows a prompt() dialog before submitting a request
  static final prompt = Attribute("hx-prompt");

  /// Replaces the URL in the browser location bar
  static final replaceUrl = Attribute("hx-replace-url");

  /// Configures various aspects of the request
  static final request = Attribute("hx-request");

  /// Controls how requests made by different elements are synchronized
  static final sync = Attribute("hx-sync");

  /// Forces elements to validate themselves before a request
  static final validate = Attribute("hx-validate");

  /// Adds values dynamically to the parameters to submit with the request (deprecated, use hx-vals)
  static final vars = Attribute("hx-vars");
}

///HTMX Header reference
final class HX {
  const HX._();
  //NOTE: Request reference

  ///indicates that the request is via an element using hx-boost
  static const boosted = 'HX-Boosted';

  ///the current URL of the browser
  static const currentURL = 'HX-Current-URL';

  ///“true” if the request is for history restoration after a miss in the local history cache
  static const historyRestoreRequest = 'HX-History-Restore-Request';

  ///the user response to an hx-prompt
  static const prompt = 'HX-Prompt';

  ///always “true”
  static const request = 'HX-Request';

  ///the id of the target element if it exists
  static const target = 'HX-Target';

  ///the name of the triggered element if it exists
  static const triggerName = 'HX-Trigger-Name';

  ///On Request: the id of the triggered element if it exists
  ///On Response: allows you to trigger client-side events
  static const trigger = 'HX-Trigger';

  //NOTE: Response reference

  ///allows you to do a client-side redirect that does not do a full page reload
  static const location = 'HX-Location';

  ///pushes a new url into the history stack
  static const pushUrl = 'HX-Push-Url';

  ///can be used to do a client-side redirect to a new location
  static const redirect = 'HX-Redirect';

  ///if set to “true” the client-side will do a full refresh of the page
  static const refresh = 'HX-Refresh';

  ///replaces the current URL in the location bar
  static const replaceUrl = 'HX-Replace-Url';

  ///allows you to specify how the response will be swapped. See hx-swap for possible values
  static const reswap = 'HX-Reswap';

  ///a CSS selector that updates the target of the content update to a different element on the page
  static const retarget = 'HX-Retarget';

  ///a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing hx-select on the triggering element
  static const reselect = 'HX-Reselect';

  ///allows you to trigger client-side events after the settle step
  static const triggerAfterSettle = 'HX-Trigger-After-Settle';

  ///allows you to trigger client-side events after the swap step
  static const triggerAfterSwap = 'HX-Trigger-After-Swap';
}

extension EventAsTrigger on Event {
  HTML get hxTrigger => hx.trigger(this.name);
}
