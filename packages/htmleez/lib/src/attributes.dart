import 'attribute.dart';
import 'html_component.dart';

final accept = Attribute("accept");
final acceptCharset = Attribute("accept-charset");
final accessKey = Attribute("accesskey");
final action = Attribute("action");
final align = Attribute("align");
final allow = Attribute("allow");
final alt = Attribute("alt");
final async = Attribute("async")("async");
final autoComplete = Attribute("autocomplete");
final autoFocus = Attribute("autofocus")("autofocus");
final autoplay = Attribute("autoplay")("autoplay");
final charset = Attribute("charset");
final checked = Attribute("checked")("checked");
final citeAttr = Attribute("cite");
final className = Attribute("class");
HtmlComponent classes(List<String> classes) => Attribute("class")(classes.isNotEmpty ? classes.reduce((a, b) => '$a $b') : "");
final cols = Attribute("cols");
final colSpan = Attribute("colspan");
final content = Attribute("content");
final contentEditable = Attribute("contenteditable");
final controls = Attribute("controls")("controls");
final coords = Attribute("coords");
final crossOrigin = Attribute("crossorigin")("crossorigin");
final dataAttr = Attribute("data");
final dateTime = Attribute("datetime");
final defaultAttr = Attribute("default")("default");
final defer = Attribute("defer")("defer");
final dir = Attribute("dir");
final disabled = Attribute("disabled")("disabled");
final download = Attribute("download")("download");
final draggable = Attribute("draggable");
final encType = Attribute("enctype");
final forAttr = Attribute("for");
final formAttr = Attribute("form");
final formAction = Attribute("formaction");
final headers = Attribute("headers");
final height = Attribute("height");
final hidden = Attribute("hidden")("hidden");
final high = Attribute("high");
final href = Attribute("href");
final hreflang = Attribute("hreflang");
final id = Attribute("id");
final integrity = Attribute("integrity");
final isMap = Attribute("ismap")("ismap");
final kind = Attribute("kind");
final labelAttr = Attribute("label");
final lang = Attribute("lang");
final list = Attribute("list");
final loop = Attribute("loop")("loop");
final low = Attribute("low");
final max = Attribute("max");
final maxLength = Attribute("maxlength");
final min = Attribute("min");
final minLength = Attribute("minlength");
final multiple = Attribute("multiple")("multiple");
final muted = Attribute("muted")("muted");
final name = Attribute("name");
final noValidate = Attribute("novalidate")("novalidate");
final open = Attribute("open")("open");
final optimum = Attribute("optimum");
final pattern = Attribute("pattern");
final placeholder = Attribute("placeholder");
final playsInline = Attribute("playsinline")("playsinline");
final poster = Attribute("poster");
final preload = Attribute("preload");
final property = Attribute("property");
final readOnly = Attribute("readonly")("readonly");
final referrerPolicy = Attribute("referrerpolicy");
final rel = Attribute("rel");
final required = Attribute("required")("required");
final reversed = Attribute("reversed")("reversed");
final rows = Attribute("rows");
final rowSpan = Attribute("rowspan");
final sandbox = Attribute("sandbox");
final scope = Attribute("scope");
final selected = Attribute("selected")("selected");
final shape = Attribute("shape");
final size = Attribute("size");
final sizes = Attribute("sizes");
final spanAttr = Attribute("span");
final spellcheck = Attribute("spellcheck");
final src = Attribute("src");
final srcdoc = Attribute("srcdoc");
final srclang = Attribute("srclang");
final start = Attribute("start");
final step = Attribute("step");
final styleAttr = Attribute("style");
final tabIndex = Attribute("tabindex");
final target = Attribute("target");
final titleAttr = Attribute("title");
final translate = Attribute("translate");
final type = Attribute("type");
final useMap = Attribute("usemap");
final value = Attribute("value");
final width = Attribute("width");
final wrap = Attribute("wrap");
