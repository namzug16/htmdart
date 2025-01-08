import 'package:htmleez/htmleez.dart';

//ignore: camel_case_types
class hxEvents {
  /// Triggered after an AJAX request has completed processing a successful response
  static final afterOnLoad = Event("afterOnLoad");

  /// Triggered after htmx has initialized a node
  static final afterProcessNode = Event("afterProcessNode");

  /// Triggered after an AJAX request has completed
  static final afterRequest = Event("afterRequest");

  /// Triggered after the DOM has settled
  static final afterSettle = Event("afterSettle");

  /// Triggered after new content has been swapped in
  static final afterSwap = Event("afterSwap");

  /// Triggered before htmx disables an element or removes it from the DOM
  static final beforeCleanupElement = Event("beforeCleanupElement");

  /// Triggered before any response processing occurs
  static final beforeOnLoad = Event("beforeOnLoad");

  /// Triggered before htmx initializes a node
  static final beforeProcessNode = Event("beforeProcessNode");

  /// Triggered before an AJAX request is made
  static final beforeRequest = Event("beforeRequest");

  /// Triggered before a swap is done, allows you to configure the swap
  static final beforeSwap = Event("beforeSwap");

  /// Triggered just before an ajax request is sent
  static final beforeSend = Event("beforeSend");

  /// Triggered before the View Transition wrapped swap occurs
  static final beforeTransition = Event("beforeTransition");

  /// Triggered before the request, allows you to customize parameters, headers
  static final configRequest = Event("configRequest");

  /// Triggered after a trigger occurs on an element, allows you to cancel (or delay) issuing the AJAX request
  static final confirm = Event("confirm");

  /// Triggered on an error during cache writing
  static final historyCacheError = Event("historyCacheError");

  /// Triggered on a cache miss in the history subsystem
  static final historyCacheMiss = Event("historyCacheMiss");

  /// Triggered on a unsuccessful remote retrieval
  static final historyCacheMissError = Event("historyCacheMissError");

  /// Triggered on a successful remote retrieval
  static final historyCacheMissLoad = Event("historyCacheMissLoad");

  /// Triggered when htmx handles a history restoration action
  static final historyRestore = Event("historyRestore");

  /// Triggered before content is saved to the history cache
  static final beforeHistorySave = Event("beforeHistorySave");

  /// Triggered when new content is added to the DOM
  static final load = Event("load");

  /// Triggered when an element refers to a SSE event in its trigger, but no parent SSE source has been defined
  static final noSSESourceError = Event("noSSESourceError");

  /// Triggered when an exception occurs during the onLoad handling in htmx
  static final onLoadError = Event("onLoadError");

  /// Triggered after an out of band element as been swapped in
  static final oobAfterSwap = Event("oobAfterSwap");

  /// Triggered before an out of band element swap is done, allows you to configure the swap
  static final oobBeforeSwap = Event("oobBeforeSwap");

  /// Triggered when an out of band element does not have a matching ID in the current DOM
  static final oobErrorNoTarget = Event("oobErrorNoTarget");

  /// Triggered after a prompt is shown
  static final prompt = Event("prompt");

  /// Triggered after an url is pushed into history
  static final pushedIntoHistory = Event("pushedIntoHistory");

  /// Triggered when an HTTP response error (non-200 or 300 response code) occurs
  static final responseError = Event("responseError");

  /// Triggered when a request is aborted
  static final sendAbort = Event("sendAbort");

  /// Triggered when a network error prevents an HTTP request from happening
  static final sendError = Event("sendError");

  /// Triggered when an error occurs with a SSE source
  static final sseError = Event("sseError");

  /// Triggered when a SSE source is opened
  static final sseOpen = Event("sseOpen");

  /// Triggered when an error occurs during the swap phase
  static final swapError = Event("swapError");

  /// Triggered when an invalid target is specified
  static final targetError = Event("targetError");

  /// Triggered when a request timeout occurs
  static final timeout = Event("timeout");
}
