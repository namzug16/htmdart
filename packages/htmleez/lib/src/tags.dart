import 'tag.dart';

//NOTE: Basic HTML

/// Defines an HTML document
final html = Tag("html", false);

/// Defines a title for the document
final title = Tag("title", false);

/// Defines the document's body
final body = Tag("body", false);

/// Defines HTML heading level 1
final h1 = Tag("h1", false);

/// Defines HTML heading level 2
final h2 = Tag("h2", false);

/// Defines HTML heading level 3
final h3 = Tag("h3", false);

/// Defines HTML heading level 4
final h4 = Tag("h4", false);

/// Defines HTML heading level 5
final h5 = Tag("h5", false);

/// Defines HTML heading level 6
final h6 = Tag("h6", false);

/// Defines a paragraph
final p = Tag("p", false);

/// Inserts a single line break
final br = Tag("br", true)([]);

/// Defines a thematic change in the content
final hr = Tag("hr", true);

//NOTE: Formatting

/// Defines an abbreviation or an acronym
final abbr = Tag("abbr", false);

/// Defines contact information for the author/owner of a document/article
final address = Tag("address", false);

/// Defines bold text
final b = Tag("b", false);

/// Isolates a part of text that might be formatted in a different direction from other text outside it
final bdi = Tag("bdi", false);

/// Overrides the current text direction
final bdo = Tag("bdo", false);

/// Defines a section that is quoted from another source
final blockquote = Tag("blockquote", false);

/// Defines the title of a work
final cite = Tag("cite", false);

/// Defines a piece of computer code
final code = Tag("code", false);

/// Defines text that has been deleted from a document
final del = Tag("del", false);

/// Specifies a term that is going to be defined within the content
final dfn = Tag("dfn", false);

/// Defines emphasized text
final em = Tag("em", false);

/// Defines a part of text in an alternate voice or mood
final i = Tag("i", false);

/// Defines a text that has been inserted into a document
final ins = Tag("ins", false);

/// Defines keyboard input
final kbd = Tag("kbd", false);

/// Defines marked/highlighted text
final mark = Tag("mark", false);

/// Defines a scalar measurement within a known range (a gauge)
final meter = Tag("meter", false);

/// Defines preformatted text
final pre = Tag("pre", false);

/// Represents the progress of a task
final progress = Tag("progress", false);

/// Defines a short quotation
final q = Tag("q", false);

/// Defines what to show in browsers that do not support ruby annotations
final rp = Tag("rp", false);

/// Defines an explanation/pronunciation of characters (for East Asian typography)
final rt = Tag("rt", false);

/// Defines a ruby annotation (for East Asian typography)
final ruby = Tag("ruby", false);

/// Defines text that is no longer correct
final s = Tag("s", false);

/// Defines sample output from a computer program
final samp = Tag("samp", false);

/// Defines smaller text
final small = Tag("small", false);

/// Defines important text
final strong = Tag("strong", false);

/// Defines subscripted text
final sub = Tag("sub", false);

/// Defines superscripted text
final sup = Tag("sup", false);

/// Defines a container for content that should be hidden when the page loads
final template = Tag("template", false);

/// Defines a specific time (or datetime)
final time = Tag("time", false);

/// Defines some text that is unarticulated and styled differently from normal text
final u = Tag("u", false);

/// Defines a variable
final varTag = Tag("var", false);

/// Defines a possible line-break
final wbr = Tag("wbr", true);

//NOTE: Forms and Input

/// Defines an HTML form for user input
final form = Tag("form", false);

/// Defines an input control
final input = Tag("input", true);

/// Defines a multiline input control (text area)
final textarea = Tag("textarea", false);

/// Defines a clickable button
final button = Tag("button", false);

/// Defines a drop-down list
final select = Tag("select", false);

/// Defines a group of related options in a drop-down list
final optgroup = Tag("optgroup", false);

/// Defines an option in a drop-down list
final option = Tag("option", false);

/// Defines a label for an <input> element
final label = Tag("label", false);

/// Groups related elements in a form
final fieldset = Tag("fieldset", false);

/// Defines a caption for a <fieldset> element
final legend = Tag("legend", false);

/// Specifies a list of pre-defined options for input controls
final datalist = Tag("datalist", false);

/// Defines the result of a calculation
final output = Tag("output", false);

//NOTE: Frames

/// Defines an inline frame
final iframe = Tag("iframe", false);

//NOTE: Images

/// Defines an image
final img = Tag("img", true);

/// Defines a client-side image map
final map = Tag("map", false);

/// Defines an area inside an image map
final area = Tag("area", true);

/// Used to draw graphics, on the fly, via scripting (usually JavaScript)
final canvas = Tag("canvas", false);

/// Defines a caption for a <figure> element
final figcaption = Tag("figcaption", false);

/// Specifies self-contained content
final figure = Tag("figure", false);

/// Defines a container for multiple image resources
final picture = Tag("picture", false);

/// Defines a container for SVG graphics
final svg = Tag("svg", false);

//NOTE: Audio / Video

/// Defines sound content
final audio = Tag("audio", false);

/// Defines multiple media resources for media elements (<video>, <audio>, and <picture>)
final source = Tag("source", true);

/// Defines text tracks for media elements (<video> and <audio>)
final track = Tag("track", true);

/// Defines a video or movie
final video = Tag("video", false);

//NOTE: Links

/// Defines a hyperlink
final a = Tag("a", false);

/// Defines the relationship between a document and an external resource (most used to link to style sheets)
final link = Tag("link", true);

/// Defines navigation links
final nav = Tag("nav", false);

//NOTE: Lists

/// Defines an alternative unordered list
final menu = Tag("menu", false);

/// Defines an unordered list
final ul = Tag("ul", false);

/// Defines an ordered list
final ol = Tag("ol", false);

/// Defines a list item
final li = Tag("li", false);

/// Defines a description list
final dl = Tag("dl", false);

/// Defines a term/name in a description list
final dt = Tag("dt", false);

/// Defines a description of a term/name in a description list
final dd = Tag("dd", false);

//NOTE: Tables

/// Defines a table
final table = Tag("table", false);

/// Defines a table caption
final caption = Tag("caption", false);

/// Defines a header cell in a table
final th = Tag("th", false);

/// Defines a row in a table
final tr = Tag("tr", false);

/// Defines a cell in a table
final td = Tag("td", false);

/// Groups the header content in a table
final thead = Tag("thead", false);

/// Groups the body content in a table
final tbody = Tag("tbody", false);

/// Groups the footer content in a table
final tfoot = Tag("tfoot", false);

/// Specifies column properties for each column within a <colgroup> element
final col = Tag("col", true);

/// Specifies a group of one or more columns in a table for formatting
final colgroup = Tag("colgroup", false);

//NOTE: Styles and Sematics

/// Defines style information for a document
final style = Tag("style", false);

/// Defines a section in a document
final div = Tag("div", false);

/// Defines a span of text within a document
final span = Tag("span", false);

/// Defines a header for a document or section
final header = Tag("header", false);

/// Defines a group of headings (<h1> to <h6>)
final hgroup = Tag("hgroup", false);

/// Defines a footer for a document or section
final footer = Tag("footer", false);

/// Specifies the main content of a document
final mainTag = Tag("main", false);

/// Defines a section in a document
final section = Tag("section", false);

/// Defines a search section
final search = Tag("search", false);

/// Defines an article
final article = Tag("article", false);

/// Defines content aside from the main page content
final aside = Tag("aside", false);

/// Defines additional details that the user can view or hide
final details = Tag("details", false);

/// Defines a dialog box or window
final dialog = Tag("dialog", false);

/// Defines a visible heading for a <details> element
final summary = Tag("summary", false);

/// Adds a machine-readable translation of a given content
final data = Tag("data", false);

//NOTE: Meta info

/// Defines information about the document
final head = Tag("head", false);

/// Defines metadata about an HTML document
final meta = Tag("meta", true);

/// Specifies the base URL/target for all relative URLs in a document
final base = Tag("base", true);

//NOTE: Programming

/// Defines a client-side script
final script = Tag("script", false);

/// Defines alternate content for users that do not support client-side scripts
final noscript = Tag("noscript", false);

/// Defines a container for an external resource
final embed = Tag("embed", true);

/// Defines a container for an external resource
final object = Tag("object", false);

/// Defines a parameter for an object
final param = Tag("param", true);
