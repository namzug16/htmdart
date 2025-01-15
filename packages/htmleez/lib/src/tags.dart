import 'tag.dart';

//NOTE: Basic HTML

/// Defines an HTML document
final html = Tag("html");

/// Defines a title for the document
final title = Tag("title");

/// Defines the document's body
final body = Tag("body");

/// Defines HTML heading level 1
final h1 = Tag("h1");

/// Defines HTML heading level 2
final h2 = Tag("h2");

/// Defines HTML heading level 3
final h3 = Tag("h3");

/// Defines HTML heading level 4
final h4 = Tag("h4");

/// Defines HTML heading level 5
final h5 = Tag("h5");

/// Defines HTML heading level 6
final h6 = Tag("h6");

/// Defines a paragraph
final p = Tag("p");

/// Inserts a single line break
final br = Tag("br", true)([]);

/// Defines a thematic change in the content
final hr = Tag("hr", true);

//NOTE: Formatting

/// Defines an abbreviation or an acronym
final abbr = Tag("abbr");

/// Defines contact information for the author/owner of a document/article
final address = Tag("address");

/// Defines bold text
final b = Tag("b");

/// Isolates a part of text that might be formatted in a different direction from other text outside it
final bdi = Tag("bdi");

/// Overrides the current text direction
final bdo = Tag("bdo");

/// Defines a section that is quoted from another source
final blockquote = Tag("blockquote");

/// Defines the title of a work
final cite = Tag("cite");

/// Defines a piece of computer code
final code = Tag("code");

/// Defines text that has been deleted from a document
final del = Tag("del");

/// Specifies a term that is going to be defined within the content
final dfn = Tag("dfn");

/// Defines emphasized text
final em = Tag("em");

/// Defines a part of text in an alternate voice or mood
final i = Tag("i");

/// Defines a text that has been inserted into a document
final ins = Tag("ins");

/// Defines keyboard input
final kbd = Tag("kbd");

/// Defines marked/highlighted text
final mark = Tag("mark");

/// Defines a scalar measurement within a known range (a gauge)
final meter = Tag("meter");

/// Defines preformatted text
final pre = Tag("pre");

/// Represents the progress of a task
final progress = Tag("progress");

/// Defines a short quotation
final q = Tag("q");

/// Defines what to show in browsers that do not support ruby annotations
final rp = Tag("rp");

/// Defines an explanation/pronunciation of characters (for East Asian typography)
final rt = Tag("rt");

/// Defines a ruby annotation (for East Asian typography)
final ruby = Tag("ruby");

/// Defines text that is no longer correct
final s = Tag("s");

/// Defines sample output from a computer program
final samp = Tag("samp");

/// Defines smaller text
final small = Tag("small");

/// Defines important text
final strong = Tag("strong");

/// Defines subscripted text
final sub = Tag("sub");

/// Defines superscripted text
final sup = Tag("sup");

/// Defines a container for content that should be hidden when the page loads
final template = Tag("template");

/// Defines a specific time (or datetime)
final time = Tag("time");

/// Defines some text that is unarticulated and styled differently from normal text
final u = Tag("u");

/// Defines a variable
final varTag = Tag("var");

/// Defines a possible line-break
final wbr = Tag("wbr", true);

//NOTE: Forms and Input

/// Defines an HTML form for user input
final form = Tag("form");

/// Defines an input control
final input = Tag("input", true);

/// Defines a multiline input control (text area)
final textarea = Tag("textarea");

/// Defines a clickable button
final button = Tag("button");

/// Defines a drop-down list
final select = Tag("select");

/// Defines a group of related options in a drop-down list
final optgroup = Tag("optgroup");

/// Defines an option in a drop-down list
final option = Tag("option");

/// Defines a label for an <input> element
final label = Tag("label");

/// Groups related elements in a form
final fieldset = Tag("fieldset");

/// Defines a caption for a <fieldset> element
final legend = Tag("legend");

/// Specifies a list of pre-defined options for input controls
final datalist = Tag("datalist");

/// Defines the result of a calculation
final output = Tag("output");

//NOTE: Frames

/// Defines an inline frame
final iframe = Tag("iframe");

//NOTE: Images

/// Defines an image
final img = Tag("img", true);

/// Defines a client-side image map
final map = Tag("map");

/// Defines an area inside an image map
final area = Tag("area", true);

/// Used to draw graphics, on the fly, via scripting (usually JavaScript)
final canvas = Tag("canvas");

/// Defines a caption for a <figure> element
final figcaption = Tag("figcaption");

/// Specifies self-contained content
final figure = Tag("figure");

/// Defines a container for multiple image resources
final picture = Tag("picture");

/// Defines a container for SVG graphics
final svg = Tag("svg");

//NOTE: Audio / Video

/// Defines sound content
final audio = Tag("audio");

/// Defines multiple media resources for media elements (<video>, <audio>, and <picture>)
final source = Tag("source", true);

/// Defines text tracks for media elements (<video> and <audio>)
final track = Tag("track", true);

/// Defines a video or movie
final video = Tag("video");

//NOTE: Links

/// Defines a hyperlink
final a = Tag("a");

/// Defines the relationship between a document and an external resource (most used to link to style sheets)
final link = Tag("link", true);

/// Defines navigation links
final nav = Tag("nav");

//NOTE: Lists

/// Defines an alternative unordered list
final menu = Tag("menu");

/// Defines an unordered list
final ul = Tag("ul");

/// Defines an ordered list
final ol = Tag("ol");

/// Defines a list item
final li = Tag("li");

/// Defines a description list
final dl = Tag("dl");

/// Defines a term/name in a description list
final dt = Tag("dt");

/// Defines a description of a term/name in a description list
final dd = Tag("dd");

//NOTE: Tables

/// Defines a table
final table = Tag("table");

/// Defines a table caption
final caption = Tag("caption");

/// Defines a header cell in a table
final th = Tag("th");

/// Defines a row in a table
final tr = Tag("tr");

/// Defines a cell in a table
final td = Tag("td");

/// Groups the header content in a table
final thead = Tag("thead");

/// Groups the body content in a table
final tbody = Tag("tbody");

/// Groups the footer content in a table
final tfoot = Tag("tfoot");

/// Specifies column properties for each column within a <colgroup> element
final col = Tag("col", true);

/// Specifies a group of one or more columns in a table for formatting
final colgroup = Tag("colgroup");

//NOTE: Styles and Sematics

/// Defines style information for a document
final style = Tag("style");

/// Defines a section in a document
final div = Tag("div");

/// Defines a span of text within a document
final span = Tag("span");

/// Defines a header for a document or section
final header = Tag("header");

/// Defines a group of headings (<h1> to <h6>)
final hgroup = Tag("hgroup");

/// Defines a footer for a document or section
final footer = Tag("footer");

/// Specifies the main content of a document
final mainTag = Tag("main");

/// Defines a section in a document
final section = Tag("section");

/// Defines a search section
final search = Tag("search");

/// Defines an article
final article = Tag("article");

/// Defines content aside from the main page content
final aside = Tag("aside");

/// Defines additional details that the user can view or hide
final details = Tag("details");

/// Defines a dialog box or window
final dialog = Tag("dialog");

/// Defines a visible heading for a <details> element
final summary = Tag("summary");

/// Adds a machine-readable translation of a given content
final data = Tag("data");

//NOTE: Meta info

/// Defines information about the document
final head = Tag("head");

/// Defines metadata about an HTML document
final meta = Tag("meta", true);

/// Specifies the base URL/target for all relative URLs in a document
final base = Tag("base", true);

//NOTE: Programming

/// Defines a client-side script
final script = Tag("script");

/// Defines alternate content for users that do not support client-side scripts
final noscript = Tag("noscript");

/// Defines a container for an external resource
final embed = Tag("embed", true);

/// Defines a container for an external resource
final object = Tag("object");

/// Defines a parameter for an object
final param = Tag("param", true);
