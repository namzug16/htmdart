//
// ignore_for_file: unintended_html_in_doc_comment

import "package:htmleez/src/attribute.dart";
import "package:htmleez/src/html_component.dart";

/// List of types the server accepts, typically a file type.
const $accept = Attribute("accept");

/// The character set, which if provided must be "UTF-8".
const $acceptCharset = Attribute("accept-charset");

/// Keyboard shortcut to activate or add focus to the element.
const $accesskey = Attribute("accesskey");

/// The URI of a program that processes the information submitted via the form.
const $action = Attribute("action");

/// Specifies the horizontal alignment of the element.
const $align = Attribute("align");

/// Specifies a feature-policy for the iframe.
const $allow = Attribute("allow");

/// Alternative text in case an image can't be displayed.
const $alt = Attribute("alt");

/// Specifies the type of content being loaded by the link.
const $as = Attribute("as");

/// Executes the script asynchronously.
const $async = Attribute("async");

/// Sets whether input is automatically capitalized when entered by user.
const $autocapitalize = Attribute("autocapitalize");

/// Indicates whether controls in this form can by default have their values automatically completed by the browser.
const $autocomplete = Attribute("autocomplete");

/// The audio or video should play as soon as possible.
const $autoplay = Attribute("autoplay");

/// Specifies the URL of an image file. Note: Although browsers and email clients may still support this attribute, it is obsolete. Use CSS background-image instead.
const $background = Attribute("background");

/// The border width. Note: This is a legacy attribute. Please use the CSS border property instead.
const $border = Attribute("border");

/// From the Media Capture specification, specifies a new file can be captured.
const $capture = Attribute("capture");

/// Declares the character encoding of the page or script.
const $charset = Attribute("charset");

/// Indicates whether the element should be checked on page load.
const $checked = Attribute("checked");

/// Contains a URI which points to the source of the quote or change.
const $cite = Attribute("cite");

/// Often used with CSS to style elements with common properties.
const $class = Attribute("class");

HtmlComponent $classes(List<String> classes) => const Attribute("class")(classes.isNotEmpty ? classes.reduce((a, b) => "$a $b") : "");

/// This attribute sets the text color using either a named color or a color specified in the hexadecimal #RRGGBB format. Note: This is a legacy attribute. Please use the CSS color property instead.
const $color = Attribute("color");

/// Defines the number of columns in a textarea.
const $cols = Attribute("cols");

/// The colspan attribute defines the number of columns a cell should span.
const $colspan = Attribute("colspan");

/// A value associated with http-equiv or name depending on the context.
const $content = Attribute("content");

/// Indicates whether the element's content is editable.
const $contenteditable = Attribute("contenteditable");

/// Indicates whether the browser should show playback controls to the user.
const $controls = Attribute("controls");

/// A set of values specifying the coordinates of the hot-spot region.
const $coords = Attribute("coords");

/// How the element handles cross-origin requests.
const $crossorigin = Attribute("crossorigin");

/// Specifies the Content Security Policy that an embedded document must agree to enforce upon itself.
const $csp = Attribute("csp");

/// Specifies the URL of the resource.
const $data = Attribute("data");

/// Lets you attach custom data attributes to an HTML element.
Attribute $data_(String attr) => Attribute("data-$attr");

/// Indicates the date and time associated with the element.
const $datetime = Attribute("datetime");

/// Indicates the preferred method to decode the image.
const $decoding = Attribute("decoding");

/// Indicates that the track should be enabled unless the user's preferences indicate something different.
const $default = Attribute("default");

/// Indicates that the script should be executed after the page has been parsed.
const $defer = Attribute("defer");

/// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left).
const $dir = Attribute("dir");

const $dirname = Attribute("dirname");

/// Indicates whether the user can interact with the element.
const $disabled = Attribute("disabled");

/// Indicates that the hyperlink is to be used for downloading a resource.
const $download = Attribute("download");

/// Defines whether the element can be dragged.
const $draggable = Attribute("draggable");

/// Defines the content type of the form data when the method is POST.
const $enctype = Attribute("enctype");

/// The enterkeyhint specifies what action label (or icon) to present for the enter key on virtual keyboards. The attribute can be used with form controls or in elements in an editing host.
const $enterkeyhint = Attribute("enterkeyhint");

/// Describes elements which belongs to this one.
const $for = Attribute("for");

/// Indicates the form that is the owner of the element.
const $form = Attribute("form");

/// Indicates the action of the element, overriding the action defined in the form.
const $formaction = Attribute("formaction");

/// If the button/input is a submit button, this attribute sets the encoding type to use during form submission. If this attribute is specified, it overrides the enctype attribute of the button's form owner.
const $formenctype = Attribute("formenctype");

/// If the button/input is a submit button, this attribute sets the submission method to use during form submission (GET, POST, etc.). If this attribute is specified, it overrides the method attribute of the button's form owner.
const $formmethod = Attribute("formmethod");

/// If the button/input is a submit button, this boolean attribute specifies that the form is not to be validated when it is submitted. If this attribute is specified, it overrides the novalidate attribute of the button's form owner.
const $formnovalidate = Attribute("formnovalidate");

/// If the button/input is a submit button, this attribute specifies the browsing context in which to display the response that is received after submitting the form. If this attribute is specified, it overrides the target attribute of the button's form owner.
const $formtarget = Attribute("formtarget");

/// IDs of the <th> elements which applies to this element.
const $headers = Attribute("headers");

/// Specifies the height of elements listed here. For all other elements, use the CSS height property. Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.
const $height = Attribute("height");

/// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
const $hidden = Attribute("hidden");

/// Indicates the lower bound of the upper range.
const $high = Attribute("high");

/// The URL of a linked resource.
const $href = Attribute("href");

/// Specifies the language of the linked resource.
const $hreflang = Attribute("hreflang");

/// Defines a pragma directive.
const $httpEquiv = Attribute("http-equiv");

/// Often used with CSS to style a specific element. The value of this attribute must be unique.
const $id = Attribute("id");

/// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
const $integrity = Attribute("integrity");

/// This attribute tells the browser to ignore the actual intrinsic size of the image and pretend it's the size specified in the attribute.
const $intrinsicsize = Attribute("intrinsicsize");

/// Provides a hint as to the type of data that might be entered by the user while editing the element or its contents.
const $inputmode = Attribute("inputmode");

/// Indicates that the image is part of a server-side image map.
const $ismap = Attribute("ismap");

const $itemprop = Attribute("itemprop");

/// Specifies the kind of text track.
const $kind = Attribute("kind");

/// Specifies a user-readable title of the element.
const $label = Attribute("label");

/// Defines the language used in the element.
const $lang = Attribute("lang");

/// Defines the script language used in the element.
const $language = Attribute("language");

/// Indicates if the element should be loaded lazily (loading="lazy") or loaded immediately (loading="eager").
const $loading = Attribute("loading");

/// Identifies a list of pre-defined options to suggest to the user.
const $list = Attribute("list");

/// Indicates whether the media should start playing from the start when it's finished.
const $loop = Attribute("loop");

/// Indicates the upper bound of the lower range.
const $low = Attribute("low");

/// Indicates the maximum value allowed.
const $max = Attribute("max");

/// Defines the maximum number of characters allowed in the element.
const $maxlength = Attribute("maxlength");

/// Defines the minimum number of characters allowed in the element.
const $minlength = Attribute("minlength");

/// Specifies a hint of the media for which the linked resource was designed.
const $media = Attribute("media");

/// Defines which HTTP method to use when submitting the form. Can be GET (default) or POST.
const $method = Attribute("method");

/// Indicates the minimum value allowed.
const $min = Attribute("min");

/// Indicates whether multiple values can be entered in an input of the type email or file.
const $multiple = Attribute("multiple");

/// Indicates whether the audio will be initially silenced on page load.
const $muted = Attribute("muted");

/// Name of the element. For example used by the server to identify the fields in form submits.
const $name = Attribute("name");

/// This attribute indicates that the form shouldn't be validated when submitted.
const $novalidate = Attribute("novalidate");

/// Indicates whether the contents are currently visible (in the case of a <details> element) or whether the dialog is active and can be interacted with (in the case of a <dialog> element).
const $open = Attribute("open");

/// Indicates the optimal numeric value.
const $optimum = Attribute("optimum");

/// Defines a regular expression which the element's value will be validated against.
const $pattern = Attribute("pattern");

/// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
const $ping = Attribute("ping");

/// Provides a hint to the user of what can be entered in the field.
const $placeholder = Attribute("placeholder");

/// A Boolean attribute indicating that the video is to be played "inline"; that is, within the element's playback area. Note that the absence of this attribute does not imply that the video will always be played in fullscreen.
const $playsinline = Attribute("playsinline");

/// A URL indicating a poster frame to show until the user plays or seeks.
const $poster = Attribute("poster");

/// Indicates whether the whole resource, parts of it or nothing should be preloaded.
const $preload = Attribute("preload");

/// Indicates whether the element can be edited.
const $readonly = Attribute("readonly");

/// Specifies which referrer is sent when fetching the resource.
const $referrerpolicy = Attribute("referrerpolicy");

/// Specifies the relationship of the target object to the link object.
const $rel = Attribute("rel");

/// Indicates whether this element is required to fill out or not.
const $required = Attribute("required");

/// Indicates whether the list should be displayed in a descending order instead of an ascending order.
const $reversed = Attribute("reversed");

/// Defines an explicit role for an element for use by assistive technologies.
const $role = Attribute("role");

/// Defines the number of rows in a text area.
const $rows = Attribute("rows");

/// Defines the number of rows a table cell should span over.
const $rowspan = Attribute("rowspan");

/// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
const $sandbox = Attribute("sandbox");

/// Defines the cells that the header test (defined in the <th> element) relates to.
const $scope = Attribute("scope");

const $scoped = Attribute("scoped");

/// Defines a value which will be selected on page load.
const $selected = Attribute("selected");

const $shape = Attribute("shape");

/// Defines the width of the element (in pixels). If the element's type attribute is text or password then it's the number of characters.
const $size = Attribute("size");

const $sizes = Attribute("sizes");

/// Assigns a slot in a shadow DOM shadow tree to an element.
const $slot = Attribute("slot");

const $span = Attribute("span");

/// Indicates whether spell checking is allowed for the element.
const $spellcheck = Attribute("spellcheck");

/// The URL of the embeddable content.
const $src = Attribute("src");

const $srcdoc = Attribute("srcdoc");

const $srclang = Attribute("srclang");

/// One or more responsive image candidates.
const $srcset = Attribute("srcset");

/// Defines the first number if other than 1.
const $start = Attribute("start");

const $step = Attribute("step");

/// Defines CSS styles which will override styles previously set.
const $style = Attribute("style");

const $summary = Attribute("summary");

/// Overrides the browser's default tab order and follows the one specified instead.
const $tabindex = Attribute("tabindex");

/// Specifies where to open the linked document or where to display the response received.
const $target = Attribute("target");

/// Text to be displayed in a tooltip when hovering over the element.
const $title = Attribute("title");

/// Specify whether an element's attribute values and the values of its text node children are to be translated when the page is localized, or whether to leave them unchanged.
const $translate = Attribute("translate");

/// Defines the type of the element.
const $type = Attribute("type");

const $usemap = Attribute("usemap");

/// Defines a default value which will be displayed in the element on page load.
const $value = Attribute("value");

/// For the elements listed here, this establishes the element's width. Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.
const $width = Attribute("width");

/// Indicates whether the text should be wrapped.
const $wrap = Attribute("wrap");

/// Associates a positioned element with an anchor element. The attribute’s value is the `id` of the element to anchor to, enabling CSS anchor positioning.
const $anchor = Attribute("anchor");

/// Controls whether input text is automatically corrected for spelling errors. This applies to editable text except on `<input>` elements with type "password", "email", or "url".
const $autocorrect = Attribute("autocorrect");

/// Indicates that an element is to be focused on page load, or as soon as the `<dialog>` it is part of is displayed. This boolean attribute is initially false.
const $autofocus = Attribute("autofocus");

/// Used to transitively export shadow parts from a nested shadow tree into a containing light tree.
const $exportparts = Attribute("exportparts");

/// A boolean attribute that makes the browser disregard user input events for the element. Useful when click events are present.
const $inert = Attribute("inert");

/// Allows you to specify that a standard HTML element should behave like a registered custom built-in element.
const $is = Attribute("is");

/// The unique, global identifier of an item.
const $itemid = Attribute("itemid");

/// Associates properties that are not descendants of an element with the `itemscope` attribute. It provides a list of element IDs with additional properties elsewhere in the document.
const $itemref = Attribute("itemref");

/// Indicates that the element's content is about a particular item, creating the item and defining the scope of the associated vocabulary.
const $itemscope = Attribute("itemscope");

/// Specifies the URL of the vocabulary that will be used to define `itemprop` properties in the data structure.
const $itemtype = Attribute("itemtype");

/// A cryptographic nonce ("number used once") used by Content Security Policy to determine whether a given fetch is allowed to proceed.
const $nonce = Attribute("nonce");

/// A space-separated list of part names for the element. This allows CSS to select and style specific elements in a shadow tree via the `::part` pseudo-element.
const $part = Attribute("part");

/// Designates an element as a popover element. Popover elements are hidden via `display: none` until they are opened by a control element or via `HTMLElement.showPopover()`.
const $popover = Attribute("popover");

/// Controls the on-screen virtual keyboard behavior on devices lacking a hardware keyboard. Accepts `auto` (or an empty string) to show the keyboard automatically, or `manual` to decouple focus from the keyboard’s state.
const $virtualkeyboardpolicy = Attribute("virtualkeyboardpolicy");

/// Indicates whether browser-provided writing suggestions should be enabled for the element. Accepts `false` to disable or `true` (or an empty string) to enable writing suggestions.
const $writingsuggestions = Attribute("writingsuggestions");

const $acceptcharset = Attribute("accept-charset");

const $property = Attribute("property");
