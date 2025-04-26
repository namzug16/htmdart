import "package:htmleez/src/tag.dart";

//NOTE: Main Root

/// Represents the root (top-level element) of an HTML document, so it is also referred to as the root element. All other elements must be descendants of this element.
const html = Tag("html");

//NOTE: Document Metadata

/// Specifies the base URL to use for all relative URLs in a document. There can be only one such element in a document.
const base = Tag("base", true);

/// Contains machine-readable information (metadata) about the document, like its title, scripts, and style sheets.
const head = Tag("head");

/// Specifies relationships between the current document and an external resource. This element is most commonly used to link to CSS but is also used to establish site icons (both "favicon" style icons and icons for the home screen and apps on mobile devices) among other things.
const link = Tag("link", true);

//
// ignore: unintended_html_in_doc_comment
/// Represents metadata that cannot be represented by other HTML meta-related elements, like <base>, <link>, <script>, <style> and <title>.
const meta = Tag("meta", true);

/// Contains style information for a document or part of a document. It contains CSS, which is applied to the contents of the document containing this element.
const style = Tag("style");

/// Defines the document's title that is shown in a browser's title bar or a page's tab. It only contains text; HTML tags within the element, if any, are also treated as plain text.
const title = Tag("title");

//NOTE: Sectioning Root

/// Represents the content of an HTML document. There can be only one such element in a document.
const body = Tag("body");

//NOTE: Content Sectioning

/// Indicates that the enclosed HTML provides contact information for a person or people, or for an organization.
const address = Tag("address");

/// Represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable (e.g., in syndication). Examples include a forum post, a magazine or newspaper article, a blog entry, a product card, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.
const article = Tag("article");

/// Represents a portion of a document whose content is only indirectly related to the document's main content. Asides are frequently presented as sidebars or call-out boxes.
const aside = Tag("aside");

/// Represents a footer for its nearest ancestor sectioning content or sectioning root element. A <footer> typically contains information about the author of the section, copyright data, or links to related documents.
const footer = Tag("footer");

/// Represents introductory content, typically a group of introductory or navigational aids. It may contain some heading elements but also a logo, a search form, an author name, and other elements.
const header = Tag("header");

/// Represents six levels of section headings. <h1> is the highest section level and <h6> is the lowest.
const h1 = Tag("h1");
const h2 = Tag("h2");
const h3 = Tag("h3");
const h4 = Tag("h4");
const h5 = Tag("h5");
const h6 = Tag("h6");

/// Represents a heading grouped with any secondary content, such as subheadings, an alternative title, or a tagline.
const hgroup = Tag("hgroup");

/// Represents the dominant content of the body of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application.
const mainTag = Tag("main");

/// Represents a section of a page whose purpose is to provide navigation links, either within the current document or to other documents. Common examples of navigation sections are menus, tables of contents, and indexes.
const nav = Tag("nav");

/// Represents a generic standalone section of a document, which doesn't have a more specific semantic element to represent it. Sections should always have a heading, with very few exceptions.
const section = Tag("section");

/// Represents a part that contains a set of form controls or other content related to performing a search or filtering operation.
const search = Tag("search");

//NOTE: Text Content

/// Indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation.
const blockquote = Tag("blockquote");

/// Provides the description, definition, or value for the preceding term (<dt>) in a description list (<dl>).
const dd = Tag("dd");

/// The generic container for flow content. It has no effect on the content or layout until styled in some way using CSS.
const div = Tag("div");

/// Represents a description list. The element encloses a list of groups of terms (specified using the <dt> element) and descriptions (provided by <dd> elements).
const dl = Tag("dl");

/// Specifies a term in a description or definition list, and as such must be used inside a <dl> element.
const dt = Tag("dt");

/// Represents a caption or legend describing the rest of the contents of its parent <figure> element.
const figcaption = Tag("figcaption");

/// Represents self-contained content, potentially with an optional caption, which is specified using the <figcaption> element.
const figure = Tag("figure");

/// Represents a thematic break between paragraph-level elements.
const hr = Tag("hr", true);

/// Represents an item in a list.
const li = Tag("li");

/// A semantic alternative to <ul>, but treated by browsers as no different than <ul>.
const menu = Tag("menu");

/// Represents an ordered list of items.
const ol = Tag("ol");

/// Represents a paragraph.
const p = Tag("p");

/// Represents preformatted text which is to be presented exactly as written in the HTML file.
const pre = Tag("pre");

/// Represents an unordered list of items.
const ul = Tag("ul");

//NOTE: Inline Text Semantics

/// Together with its href attribute, creates a hyperlink to web pages, files, email addresses, locations within the current page, or anything else a URL can address.
const a = Tag("a");

/// Represents an abbreviation or acronym.
const abbr = Tag("abbr");

/// Used to draw the reader's attention to the element's contents, which are not otherwise granted special importance.
const b = Tag("b");

/// Tells the browser's bidirectional algorithm to treat the text it contains in isolation from its surrounding text.
const bdi = Tag("bdi");

/// Overrides the current directionality of text, so that the text within is rendered in a different direction.
const bdo = Tag("bdo");

/// Produces a line break in text (carriage-return). It is useful for writing a poem or an address, where the division of lines is significant.
const br = Tag("br", true);

/// Used to mark up the title of a cited creative work.
const cite = Tag("cite");

/// Displays its contents styled in a fashion intended to indicate that the text is a short fragment of computer code.
const code = Tag("code");

/// Links a given piece of content with a machine-readable translation.
const data = Tag("data");

/// Used to indicate the term being defined within the context of a definition phrase or sentence.
const dfn = Tag("dfn");

/// Marks text that has stress emphasis.
const em = Tag("em");

/// Represents a range of text that is set off from the normal text for some reason.
const i = Tag("i");

/// Represents a span of inline text denoting textual user input from a keyboard, voice input, or any other text entry device.
const kbd = Tag("kbd");

/// Represents text which is marked or highlighted for reference or notation purposes.
const mark = Tag("mark");

/// Indicates that the enclosed text is a short inline quotation.
const q = Tag("q");

/// Used to provide fall-back parentheses for browsers that do not support the display of ruby annotations.
const rp = Tag("rp");

/// Specifies the ruby text component of a ruby annotation.
const rt = Tag("rt");

/// Represents small annotations that are rendered above, below, or next to base text.
const ruby = Tag("ruby");

/// Renders text with a strikethrough, or a line through it.
const s = Tag("s");

/// Used to enclose inline text which represents sample (or quoted) output from a computer program.
const samp = Tag("samp");

/// Represents side-comments and small print, like copyright and legal text.
const small = Tag("small");

/// A generic inline container for phrasing content, which does not inherently represent anything.
const span = Tag("span");

/// Indicates that its contents have strong importance, seriousness, or urgency.
const strong = Tag("strong");

/// Specifies inline text which should be displayed as subscript for solely typographical reasons.
const sub = Tag("sub");

/// Specifies inline text which is to be displayed as superscript for solely typographical reasons.
const sup = Tag("sup");

/// Represents a specific period in time.
const time = Tag("time");

/// Represents a span of inline text which should be rendered in a way that indicates that it has a non-textual annotation.
const u = Tag("u");

/// Represents the name of a variable in a mathematical expression or a programming context.
const varTag = Tag("var");

/// Represents a word break opportunity.
const wbr = Tag("wbr", true);

//NOTE: Image and Multimedia

/// Defines an area inside an image map that has predefined clickable areas.
const area = Tag("area", true);

/// Used to embed sound content in documents.
const audio = Tag("audio");

/// Embeds an image into the document.
const img = Tag("img", true);

/// Used with <area> elements to define an image map.
const map = Tag("map");

/// Used as a child of the media elements, audio and video.
const track = Tag("track", true);

/// Embeds a media player which supports video playback into the document.
const video = Tag("video");

//NOTE: Embedded Content

/// Embeds external content at the specified point in the document.
const embed = Tag("embed", true);

/// Represents a nested browsing context, like <iframe> but with more native privacy features built in.
const fencedframe = Tag("fencedframe");

/// Represents a nested browsing context, embedding another HTML page into the current one.
const iframe = Tag("iframe");

/// Represents an external resource, which can be treated as an image, a nested browsing context, or a resource to be handled by a plugin.
const object = Tag("object");

/// Contains zero or more <source> elements and one <img> element to offer alternative versions of an image for different display/device scenarios.
const picture = Tag("picture");

/// Specifies multiple media resources for the picture, the audio element, or the video element.
const source = Tag("source", true);

//NOTE: SVG and MathML

/// Container defining a new coordinate system and viewport.
const svg = Tag("svg");

/// The top-level element in MathML. Every valid MathML instance must be wrapped in it.
const math = Tag("math");

//NOTE: Scripting

/// Container element to use with either the canvas scripting API or the WebGL API to draw graphics and animations.
const canvas = Tag("canvas");

/// Defines a section of HTML to be inserted if a script type on the page is unsupported or if scripting is currently turned off in the browser.
const noscript = Tag("noscript");

/// Used to embed executable code or data; this is typically used to embed or refer to JavaScript code.
const script = Tag("script");

//NOTE: Demarcating Edits

/// Represents a range of text that has been deleted from a document.
const del = Tag("del");

/// Represents a range of text that has been added to a document.
const ins = Tag("ins");

//NOTE: Table Content

/// Specifies the caption (or title) of a table.
const caption = Tag("caption");

/// Defines one or more columns in a column group represented by its implicit or explicit parent <colgroup> element.
const col = Tag("col", true);

/// Defines a group of columns within a table.
const colgroup = Tag("colgroup");

/// Represents tabular data—that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data.
const table = Tag("table");

/// Encapsulates a set of table rows (<tr> elements), indicating that they comprise the body of a table's (main) data.
const tbody = Tag("tbody");

/// A child of the <tr> element, it defines a cell of a table that contains data.
const td = Tag("td");

/// Encapsulates a set of table rows (<tr> elements), indicating that they comprise the foot of a table with information about the table's columns.
const tfoot = Tag("tfoot");

/// A child of the <tr> element, it defines a cell as the header of a group of table cells.
const th = Tag("th");

/// Encapsulates a set of table rows (<tr> elements), indicating that they comprise the head of a table with information about the table's columns.
const thead = Tag("thead");

/// Defines a row of cells in a table.
const tr = Tag("tr");

//NOTE: Forms

/// An interactive element activated by a user with a mouse, keyboard, finger, voice command, or other assistive technology.
const button = Tag("button");

/// Contains a set of <option> elements that represent the permissible or recommended options available to choose from within other controls.
const datalist = Tag("datalist");

/// Used to group several controls as well as labels (<label>) within a web form.
const fieldset = Tag("fieldset");

/// Represents a document section containing interactive controls for submitting information.
const form = Tag("form");

/// Used to create interactive controls for web-based forms to accept data from the user.
const input = Tag("input", true);

/// Represents a caption for an item in a user interface.
const label = Tag("label");

/// Represents a caption for the content of its parent <fieldset>.
const legend = Tag("legend");

/// Represents either a scalar value within a known range or a fractional value.
const meter = Tag("meter");

/// Creates a grouping of options within a <select> element.
const optgroup = Tag("optgroup");

/// Used to define an item contained in a select, an <optgroup>, or a <datalist> element.
const option = Tag("option");

/// Container element into which a site or app can inject the results of a calculation or the outcome of a user action.
const output = Tag("output");

/// Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
const progress = Tag("progress");

/// Represents a control that provides a menu of options.
const select = Tag("select");

/// Represents a multi-line plain-text editing control.
const textarea = Tag("textarea");

//NOTE: Interactive Elements

/// Creates a disclosure widget in which information is visible only when the widget is toggled into an "open" state.
const details = Tag("details");

/// Represents a dialog box or other interactive component, such as a dismissible alert, inspector, or subwindow.
const dialog = Tag("dialog");

/// Specifies a summary, caption, or legend for a details element's disclosure box.
const summary = Tag("summary");

//NOTE: Web Components

/// Part of the Web Components technology suite, this element is a placeholder inside a web component that you can fill with your own markup.
const slot = Tag("slot");

/// A mechanism for holding HTML that is not to be rendered immediately when a page is loaded but may be instantiated subsequently during runtime using JavaScript.
const template = Tag("template");
