//ignore: camel_case_types
class hxEvents {
  /// Triggered after an AJAX request has completed processing a successful response
  static final afterOnLoad = "htmx:afterOnLoad";

  /// Triggered after htmx has initialized a node
  static final afterProcessNode = "htmx:afterProcessNode";

  /// Triggered after an AJAX request has completed
  static final afterRequest = "htmx:afterRequest";

  /// Triggered after the DOM has settled
  static final afterSettle = "htmx:afterSettle";

  /// Triggered after new content has been swapped in
  static final afterSwap = "htmx:afterSwap";

  /// Triggered before htmx disables an element or removes it from the DOM
  static final beforeCleanupElement = "htmx:beforeCleanupElement";

  /// Triggered before any response processing occurs
  static final beforeOnLoad = "htmx:beforeOnLoad";

  /// Triggered before htmx initializes a node
  static final beforeProcessNode = "htmx:beforeProcessNode";

  /// Triggered before an AJAX request is made
  static final beforeRequest = "htmx:beforeRequest";

  /// Triggered before a swap is done, allows you to configure the swap
  static final beforeSwap = "htmx:beforeSwap";

  /// Triggered just before an ajax request is sent
  static final beforeSend = "htmx:beforeSend";

  /// Triggered before the View Transition wrapped swap occurs
  static final beforeTransition = "htmx:beforeTransition";

  /// Triggered before the request, allows you to customize parameters, headers
  static final configRequest = "htmx:configRequest";

  /// Triggered after a trigger occurs on an element, allows you to cancel (or delay) issuing the AJAX request
  static final confirm = "htmx:confirm";

  /// Triggered on an error during cache writing
  static final historyCacheError = "htmx:historyCacheError";

  /// Triggered on a cache miss in the history subsystem
  static final historyCacheMiss = "htmx:historyCacheMiss";

  /// Triggered on a unsuccessful remote retrieval
  static final historyCacheMissError = "htmx:historyCacheMissError";

  /// Triggered on a successful remote retrieval
  static final historyCacheMissLoad = "htmx:historyCacheMissLoad";

  /// Triggered when htmx handles a history restoration action
  static final historyRestore = "htmx:historyRestore";

  /// Triggered before content is saved to the history cache
  static final beforeHistorySave = "htmx:beforeHistorySave";

  /// Triggered when new content is added to the DOM
  static final load = "htmx:load";

  /// Triggered when an element refers to a SSE event in its trigger, but no parent SSE source has been defined
  static final noSSESourceError = "htmx:noSSESourceError";

  /// Triggered when an exception occurs during the onLoad handling in htmx
  static final onLoadError = "htmx:onLoadError";

  /// Triggered after an out of band element as been swapped in
  static final oobAfterSwap = "htmx:oobAfterSwap";

  /// Triggered before an out of band element swap is done, allows you to configure the swap
  static final oobBeforeSwap = "htmx:oobBeforeSwap";

  /// Triggered when an out of band element does not have a matching ID in the current DOM
  static final oobErrorNoTarget = "htmx:oobErrorNoTarget";

  /// Triggered after a prompt is shown
  static final prompt = "htmx:prompt";

  /// Triggered after an url is pushed into history
  static final pushedIntoHistory = "htmx:pushedIntoHistory";

  /// Triggered when an HTTP response error (non-200 or 300 response code) occurs
  static final responseError = "htmx:responseError";

  /// Triggered when a request is aborted
  static final sendAbort = "htmx:sendAbort";

  /// Triggered when a network error prevents an HTTP request from happening
  static final sendError = "htmx:sendError";

  /// Triggered when an error occurs with a SSE source
  static final sseError = "htmx:sseError";

  /// Triggered when a SSE source is opened
  static final sseOpen = "htmx:sseOpen";

  /// Triggered when an error occurs during the swap phase
  static final swapError = "htmx:swapError";

  /// Triggered when an invalid target is specified
  static final targetError = "htmx:targetError";

  /// Triggered when a request timeout occurs
  static final timeout = "htmx:timeout";
}
