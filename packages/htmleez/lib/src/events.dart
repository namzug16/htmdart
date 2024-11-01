import 'command.dart';
import 'element.dart';
import 'event.dart';

//ignore: camel_case_types
class ev {
  ev._();

  static Element onEvent(String event, List<Command> commands) => Event(event)(commands);

  //NOTE: Window events

  /// Script to be run after the document is printed
  static final onafterprint = Event("onafterprint");

  /// Script to be run before the document is printed
  static final onbeforeprint = Event("onbeforeprint");

  /// Script to be run when the document is about to be unloaded
  static final onbeforeunload = Event("onbeforeunload");

  /// Script to be run when an error occurs
  static final onerror = Event("onerror");

  /// Script to be run when there have been changes to the anchor part of a URL
  static final onhashchange = Event("onhashchange");

  /// Fires after the page is finished loading
  static final onload = Event("onload");

  /// Script to be run when the message event is triggered
  static final onmessage = Event("onmessage");

  /// Script to be run when the browser starts to work offline
  static final onoffline = Event("onoffline");

  /// Script to be run when the browser starts to work online
  static final ononline = Event("ononline");

  /// Script to be run when a user navigates away from a page
  static final onpagehide = Event("onpagehide");

  /// Script to be run when a user navigates to a page
  static final onpageshow = Event("onpageshow");

  /// Script to be run when the window's history changes
  static final onpopstate = Event("onpopstate");

  /// Fires when the browser window is resized
  static final onresize = Event("onresize");

  /// Script to be run when a Web Storage area is updated
  static final onstorage = Event("onstorage");

  /// Fires once a page has unloaded (or the browser window has been closed)
  static final onunload = Event("onunload");

  //NOTE: Form events

  /// Fires the moment that the element loses focus
  static final onblur = Event("onblur");

  /// Fires the moment when the value of the element is changed
  static final onchange = Event("onchange");

  /// Script to be run when a context menu is triggered
  static final oncontextmenu = Event("oncontextmenu");

  /// Fires the moment when the element gets focus
  static final onfocus = Event("onfocus");

  /// Script to be run when an element gets user input
  static final oninput = Event("oninput");

  /// Script to be run when an element is invalid
  static final oninvalid = Event("oninvalid");

  /// Fires when the Reset button in a form is clicked
  static final onreset = Event("onreset");

  /// Fires when the user writes something in a search field (for <input="search">)
  static final onsearch = Event("onsearch");

  /// Fires after some text has been selected in an element
  static final onselect = Event("onselect");

  /// Fires when a form is submitted
  static final onsubmit = Event("onsubmit");

  //NOTE: Keyboard events

  /// Fires when a user is pressing a key
  static final onkeydown = Event("onkeydown");

  /// Fires when a user presses a key
  static final onkeypress = Event("onkeypress");

  /// Fires when a user releases a key
  static final onkeyup = Event("onkeyup");

  //NOTE: Mouse events

  /// Fires on a mouse click on the element
  static final onclick = Event("onclick");

  /// Fires on a mouse double-click on the element
  static final ondblclick = Event("ondblclick");

  /// Fires when a mouse button is pressed down on an element
  static final onmousedown = Event("onmousedown");

  /// Fires when the mouse pointer is moving while it is over an element
  static final onmousemove = Event("onmousemove");

  /// Fires when the mouse pointer moves out of an element
  static final onmouseout = Event("onmouseout");

  /// Fires when the mouse pointer moves over an element
  static final onmouseover = Event("onmouseover");

  /// Fires when a mouse button is released over an element
  static final onmouseup = Event("onmouseup");

  /// Deprecated. Use the onwheel attribute instead
  static final onmousewheel = Event("onmousewheel");

  /// Fires when the mouse wheel rolls up or down over an element
  static final onwheel = Event("onwheel");

  //NOTE: Clipboard events

  /// Fires when the user copies the content of an element
  static final oncopy = Event("oncopy");

  /// Fires when the user cuts the content of an element
  static final oncut = Event("oncut");

  /// Fires when the user pastes some content in an element
  static final onpaste = Event("onpaste");
}
