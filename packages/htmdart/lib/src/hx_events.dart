//ignore: camel_case_types
final class HxEvents {
  const HxEvents();

  /// Triggered after an AJAX request has completed processing a successful response
  final afterOnLoad = "htmx:afterOnLoad";

  /// Triggered after htmx has initialized a node
  final afterProcessNode = "htmx:afterProcessNode";

  /// Triggered after an AJAX request has completed
  final afterRequest = "htmx:afterRequest";

  /// Triggered after the DOM has settled
  final afterSettle = "htmx:afterSettle";

  /// Triggered after new content has been swapped in
  final afterSwap = "htmx:afterSwap";

  /// Triggered before htmx disables an element or removes it from the DOM
  final beforeCleanupElement = "htmx:beforeCleanupElement";

  /// Triggered before any response processing occurs
  final beforeOnLoad = "htmx:beforeOnLoad";

  /// Triggered before htmx initializes a node
  final beforeProcessNode = "htmx:beforeProcessNode";

  /// Triggered before an AJAX request is made
  final beforeRequest = "htmx:beforeRequest";

  /// Triggered before a swap is done, allows you to configure the swap
  final beforeSwap = "htmx:beforeSwap";

  /// Triggered just before an ajax request is sent
  final beforeSend = "htmx:beforeSend";

  /// Triggered before the View Transition wrapped swap occurs
  final beforeTransition = "htmx:beforeTransition";

  /// Triggered before the request, allows you to customize parameters, headers
  final configRequest = "htmx:configRequest";

  /// Triggered after a trigger occurs on an element, allows you to cancel (or delay) issuing the AJAX request
  final confirm = "htmx:confirm";

  /// Triggered on an error during cache writing
  final historyCacheError = "htmx:historyCacheError";

  /// Triggered on a cache miss in the history subsystem
  final historyCacheMiss = "htmx:historyCacheMiss";

  /// Triggered on a unsuccessful remote retrieval
  final historyCacheMissError = "htmx:historyCacheMissError";

  /// Triggered on a successful remote retrieval
  final historyCacheMissLoad = "htmx:historyCacheMissLoad";

  /// Triggered when htmx handles a history restoration action
  final historyRestore = "htmx:historyRestore";

  /// Triggered before content is saved to the history cache
  final beforeHistorySave = "htmx:beforeHistorySave";

  /// Triggered when new content is added to the DOM
  final load = "htmx:load";

  /// Triggered when an element refers to a SSE event in its trigger, but no parent SSE source has been defined
  final noSSESourceError = "htmx:noSSESourceError";

  /// Triggered when an exception occurs during the onLoad handling in htmx
  final onLoadError = "htmx:onLoadError";

  /// Triggered after an out of band element as been swapped in
  final oobAfterSwap = "htmx:oobAfterSwap";

  /// Triggered before an out of band element swap is done, allows you to configure the swap
  final oobBeforeSwap = "htmx:oobBeforeSwap";

  /// Triggered when an out of band element does not have a matching ID in the current DOM
  final oobErrorNoTarget = "htmx:oobErrorNoTarget";

  /// Triggered after a prompt is shown
  final prompt = "htmx:prompt";

  /// Triggered after an url is pushed into history
  final pushedIntoHistory = "htmx:pushedIntoHistory";

  /// Triggered when an HTTP response error (non-200 or 300 response code) occurs
  final responseError = "htmx:responseError";

  /// Triggered when a request is aborted
  final sendAbort = "htmx:sendAbort";

  /// Triggered when a network error prevents an HTTP request from happening
  final sendError = "htmx:sendError";

  /// Triggered when an error occurs with a SSE source
  final sseError = "htmx:sseError";

  /// Triggered when a SSE source is opened
  final sseOpen = "htmx:sseOpen";

  /// Triggered when an error occurs during the swap phase
  final swapError = "htmx:swapError";

  /// Triggered when an invalid target is specified
  final targetError = "htmx:targetError";

  /// Triggered when a request timeout occurs
  final timeout = "htmx:timeout";
}
