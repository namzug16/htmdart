//
// ignore_for_file: unintended_html_in_doc_comment

import "package:htmleez/src/attribute.dart";

//NOTE: Window Event Attributes

/// Script to be run after the document is printed
const $onafterprint = RawAttribute("onafterprint");

/// Script to be run before the document is printed
const $onbeforeprint = RawAttribute("onbeforeprint");

/// Script to be run when the document is about to be unloaded
const $onbeforeunload = RawAttribute("onbeforeunload");

/// Script to be run when an error occurs
const $onerror = RawAttribute("onerror");

/// Script to be run when there has been changes to the anchor part of a URL
const $onhashchange = RawAttribute("onhashchange");

/// Fires after the page is finished loading
const $onload = RawAttribute("onload");

/// Script to be run when the message is triggered
const $onmessage = RawAttribute("onmessage");

/// Script to be run when the browser starts to work offline
const $onoffline = RawAttribute("onoffline");

/// Script to be run when the browser starts to work online
const $ononline = RawAttribute("ononline");

/// Script to be run when a user navigates away from a page
const $onpagehide = RawAttribute("onpagehide");

/// Script to be run when a user navigates to a page
const $onpageshow = RawAttribute("onpageshow");

/// Script to be run when the window's history changes
const $onpopstate = RawAttribute("onpopstate");

/// Fires when the browser window is resized
const $onresize = RawAttribute("onresize");

/// Script to be run when a Web Storage area is updated
const $onstorage = RawAttribute("onstorage");

/// Fires once a page has unloaded (or the browser window has been closed)
const $onunload = RawAttribute("onunload");

//NOTE: Form Events

/// Fires the moment that the element loses focus
const $onblur = RawAttribute("onblur");

/// Fires the moment when the value of the element is changed
const $onchange = RawAttribute("onchange");

/// Script to be run when a context menu is triggered
const $oncontextmenu = RawAttribute("oncontextmenu");

/// Fires the moment when the element gets focus
const $onfocus = RawAttribute("onfocus");

/// Script to be run when an element gets user input
const $oninput = RawAttribute("oninput");

/// Script to be run when an element is invalid
const $oninvalid = RawAttribute("oninvalid");

/// Fires when the Reset button in a form is clicked
const $onreset = RawAttribute("onreset");

/// Fires when the user writes something in a search field (for <input="search">)
const $onsearch = RawAttribute("onsearch");

/// Fires after some text has been selected in an element
const $onselect = RawAttribute("onselect");

/// Fires when a form is submitted
const $onsubmit = RawAttribute("onsubmit");

//NOTE: Keyboard Events

/// Fires when a user is pressing a key
const $onkeydown = RawAttribute("onkeydown");

/// Fires when a user presses a key
const $onkeypress = RawAttribute("onkeypress");

/// Fires when a user releases a key
const $onkeyup = RawAttribute("onkeyup");

//NOTE: Mouse Events

/// Fires on a mouse click on the element
const $onclick = RawAttribute("onclick");

/// Fires on a mouse double-click on the element
const $ondblclick = RawAttribute("ondblclick");

/// Fires when a mouse button is pressed down on an element
const $onmousedown = RawAttribute("onmousedown");

/// Fires when the mouse pointer is moving while it is over an element
const $onmousemove = RawAttribute("onmousemove");

/// Fires when the mouse pointer moves out of an element
const $onmouseout = RawAttribute("onmouseout");

/// Fires when the mouse pointer moves over an element
const $onmouseover = RawAttribute("onmouseover");

/// Fires when a mouse button is released over an element
const $onmouseup = RawAttribute("onmouseup");

/// Fires when the mouse wheel rolls up or down over an element
const $onwheel = RawAttribute("onwheel");

//NOTE: Drag Events

/// Script to be run when an element is dragged
const $ondrag = RawAttribute("ondrag");

/// Script to be run at the end of a drag operation
const $ondragend = RawAttribute("ondragend");

/// Script to be run when an element has been dragged to a valid drop target
const $ondragenter = RawAttribute("ondragenter");

/// Script to be run when an element leaves a valid drop target
const $ondragleave = RawAttribute("ondragleave");

/// Script to be run when an element is being dragged over a valid drop target
const $ondragover = RawAttribute("ondragover");

/// Script to be run at the start of a drag operation
const $ondragstart = RawAttribute("ondragstart");

/// Script to be run when dragged element is being dropped
const $ondrop = RawAttribute("ondrop");

/// Script to be run when an element's scrollbar is being scrolled
const $onscroll = RawAttribute("onscroll");

//NOTE: Clipboard Events

/// Fires when the user copies the content of an element
const $oncopy = RawAttribute("oncopy");

/// Fires when the user cuts the content of an element
const $oncut = RawAttribute("oncut");

/// Fires when the user pastes some content in an element
const $onpaste = RawAttribute("onpaste");

//NOTE: Media Events

/// Script to be run on abort
const $onabort = RawAttribute("onabort");

/// Script to be run when a file is ready to start playing (when it has buffered enough to begin)
const $oncanplay = RawAttribute("oncanplay");

/// Script to be run when a file can be played all the way to the end without pausing for buffering
const $oncanplaythrough = RawAttribute("oncanplaythrough");

/// Script to be run when the cue changes in a <track> element
const $oncuechange = RawAttribute("oncuechange");

/// Script to be run when the length of the media changes
const $ondurationchange = RawAttribute("ondurationchange");

/// Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
const $onemptied = RawAttribute("onemptied");

/// Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
const $onended = RawAttribute("onended");

/// Script to be run when media data is loaded
const $onloadeddata = RawAttribute("onloadeddata");

/// Script to be run when meta data (like dimensions and duration) are loaded
const $onloadedmetadata = RawAttribute("onloadedmetadata");

/// Script to be run just as the file begins to load before anything is actually loaded
const $onloadstart = RawAttribute("onloadstart");

/// Script to be run when the media is paused either by the user or programmatically
const $onpause = RawAttribute("onpause");

/// Script to be run when the media is ready to start playing
const $onplay = RawAttribute("onplay");

/// Script to be run when the media actually has started playing
const $onplaying = RawAttribute("onplaying");

/// Script to be run when the browser is in the process of getting the media data
const $onprogress = RawAttribute("onprogress");

/// Script to be run each time the playback rate changes (like when a user switches to a slow motion or fast forward mode)
const $onratechange = RawAttribute("onratechange");

/// Script to be run when the seeking attribute is set to false indicating that seeking has ended
const $onseeked = RawAttribute("onseeked");

/// Script to be run when the seeking attribute is set to true indicating that seeking is active
const $onseeking = RawAttribute("onseeking");

/// Script to be run when the browser is unable to fetch the media data for whatever reason
const $onstalled = RawAttribute("onstalled");

/// Script to be run when fetching the media data is stopped before it is completely loaded for whatever reason
const $onsuspend = RawAttribute("onsuspend");

/// Script to be run when the playing position has changed (like when the user fast forwards to a different point in the media)
const $ontimeupdate = RawAttribute("ontimeupdate");

/// Script to be run each time the volume is changed which (includes setting the volume to "mute")
const $onvolumechange = RawAttribute("onvolumechange");

/// Script to be run when the media has paused but is expected to resume (like when the media pauses to buffer more data)
const $onwaiting = RawAttribute("onwaiting");

//NOTE: Misc Events

/// Fires when the user opens or closes the <details> element
const $ontoggle = RawAttribute("ontoggle");
