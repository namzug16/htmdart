import 'package:html/parser.dart' as html;
import 'package:html/dom.dart';

String translateHtml(String htmlInput) {
  final document = html.parse(htmlInput);

  final List<Node> nodes = document.nodes;

  final transformedNodes =
      nodes.map((e) => transformNode(e, 0)).where((node) => node.isNotEmpty);

  return transformedNodes.join('\n');
}

String transformNode(Node node, int lvl) {
  if (node is Text) {
    final trimmed = node.text.trim();
    return trimmed.isEmpty ? '' : '${"  " * lvl}"$trimmed".t';
  }

  if (node is Element) {
    var tagName = node.localName ?? 'unknown';

    final mappedTag = _tags[tagName];

    if (mappedTag == null) {
      tagName = 'Tag("$tagName")';
    } else {
      tagName = mappedTag;
    }

    //NOTE: Special case. "br" is the only tag that does not need to be call
    if (tagName == "br") {
      return '${"  " * lvl}$tagName';
    }

    final attributes = node.attributes.entries.map((attr) {
      var name = attr.key.toString();
      final value = attr.value;

      if (name.startsWith("hx")) {
        name = "hx.${_kebabToCamelCase(name.substring(3))}";
      } else {
        final mappedAttribute = _attributes[name];
        if (mappedAttribute == null) {
          name = 'Attribute("$name")';
        } else {
          if (mappedAttribute.endsWith(".void")) {
            //NOTE: this might lose the given value
            name = mappedAttribute.split(".").first;
            return '${"  " * (lvl + 1)}$name';
          } else {
            name = mappedAttribute;
          }
        }
      }

      return '${"  " * (lvl + 1)}$name("$value")';
    });

    final children = node.nodes
        .map((e) => transformNode(e, lvl + 1))
        .where((c) => c.isNotEmpty);

    final allInside = [
      ...attributes,
      ...children,
    ].join(',\n');

    if (allInside.isEmpty) {
      return '${"  " * lvl}$tagName([])';
    }

    return '${"  " * lvl}$tagName([\n$allInside,\n${"  " * lvl}])';
  }

  return '';
}

String _kebabToCamelCase(String text) {
  final parts = text.split('-');
  if (parts.isEmpty) return text;

  final firstPart = parts.first.toLowerCase();

  final camelCaseRest = parts.skip(1).map((part) {
    if (part.isEmpty) return '';
    return part[0].toUpperCase() + part.substring(1).toLowerCase();
  }).join('');

  return firstPart + camelCaseRest;
}

//NOTE: Attributes extracted from the latest htmleez attributes file
const _attributes = {
  "accept": "accept",
  "accept-charset": "acceptCharset",
  "accesskey": "accessKey",
  "action": "action",
  "align": "align",
  "allow": "allow",
  "alt": "alt",
  "async": "async.void",
  "autocomplete": "autoComplete",
  "autofocus": "autoFocus.void",
  "autoplay": "autoplay.void",
  "charset": "charset",
  "checked": "checked.void",
  "cite": "citeAttr",
  "class": "className",
  "cols": "cols",
  "colspan": "colSpan",
  "content": "content",
  "contenteditable": "contentEditable",
  "controls": "controls.void",
  "coords": "coords",
  "crossorigin": "crossOrigin.void",
  "data": "dataAttr",
  "datetime": "dateTime",
  "default": "defaultAttr.void",
  "defer": "defer.void",
  "dir": "dir",
  "disabled": "disabled.void",
  "download": "download.void",
  "draggable": "draggable",
  "enctype": "encType",
  "for": "forAttr",
  "form": "formAttr",
  "formaction": "formAction",
  "headers": "headers",
  "height": "height",
  "hidden": "hidden.void",
  "high": "high",
  "href": "href",
  "hreflang": "hreflang",
  "id": "id",
  "integrity": "integrity",
  "ismap": "isMap.void",
  "kind": "kind",
  "label": "labelAttr",
  "lang": "lang",
  "list": "list",
  "loop": "loop.void",
  "low": "low",
  "max": "max",
  "maxlength": "maxLength",
  "min": "min",
  "minlength": "minLength",
  "multiple": "multiple.void",
  "muted": "muted.void",
  "name": "name",
  "novalidate": "noValidate.void",
  "open": "open.void",
  "optimum": "optimum",
  "pattern": "pattern",
  "placeholder": "placeholder",
  "playsinline": "playsInline.void",
  "poster": "poster",
  "preload": "preload",
  "property": "property",
  "readonly": "readOnly.void",
  "referrerpolicy": "referrerPolicy",
  "rel": "rel",
  "required": "required.void",
  "reversed": "reversed.void",
  "rows": "rows",
  "rowspan": "rowSpan",
  "sandbox": "sandbox",
  "scope": "scope",
  "selected": "selected.void",
  "shape": "shape",
  "size": "size",
  "sizes": "sizes",
  "span": "spanAttr",
  "spellcheck": "spellcheck",
  "src": "src",
  "srcdoc": "srcdoc",
  "srclang": "srclang",
  "start": "start",
  "step": "step",
  "style": "styleAttr",
  "tabindex": "tabIndex",
  "target": "target",
  "title": "titleAttr",
  "translate": "translate",
  "type": "type",
  "usemap": "useMap",
  "value": "value",
  "width": "width",
  "wrap": "wrap",
};

const _tags = {
  "html": "html",
  "title": "title",
  "body": "body",
  "h1": "h1",
  "h2": "h2",
  "h3": "h3",
  "h4": "h4",
  "h5": "h5",
  "h6": "h6",
  "p": "p",
  "br": "br",
  "hr": "hr",
  "abbr": "abbr",
  "address": "address",
  "b": "b",
  "bdi": "bdi",
  "bdo": "bdo",
  "blockquote": "blockquote",
  "cite": "cite",
  "code": "code",
  "del": "del",
  "dfn": "dfn",
  "em": "em",
  "i": "i",
  "ins": "ins",
  "kbd": "kbd",
  "mark": "mark",
  "meter": "meter",
  "pre": "pre",
  "progress": "progress",
  "q": "q",
  "rp": "rp",
  "rt": "rt",
  "ruby": "ruby",
  "s": "s",
  "samp": "samp",
  "small": "small",
  "strong": "strong",
  "sub": "sub",
  "sup": "sup",
  "template": "template",
  "time": "time",
  "u": "u",
  "var": "varTag",
  "wbr": "wbr",
  "form": "form",
  "input": "input",
  "textarea": "textarea",
  "button": "button",
  "select": "select",
  "optgroup": "optgroup",
  "option": "option",
  "label": "label",
  "fieldset": "fieldset",
  "legend": "legend",
  "datalist": "datalist",
  "output": "output",
  "iframe": "iframe",
  "img": "img",
  "map": "map",
  "area": "area",
  "canvas": "canvas",
  "figcaption": "figcaption",
  "figure": "figure",
  "picture": "picture",
  "svg": "svg",
  "audio": "audio",
  "source": "source",
  "track": "track",
  "video": "video",
  "a": "a",
  "link": "link",
  "nav": "nav",
  "menu": "menu",
  "ul": "ul",
  "ol": "ol",
  "li": "li",
  "dl": "dl",
  "dt": "dt",
  "dd": "dd",
  "table": "table",
  "caption": "caption",
  "th": "th",
  "tr": "tr",
  "td": "td",
  "thead": "thead",
  "tbody": "tbody",
  "tfoot": "tfoot",
  "col": "col",
  "colgroup": "colgroup",
  "style": "style",
  "div": "div",
  "span": "span",
  "header": "header",
  "hgroup": "hgroup",
  "footer": "footer",
  "main": "mainTag",
  "section": "section",
  "search": "search",
  "article": "article",
  "aside": "aside",
  "details": "details",
  "dialog": "dialog",
  "summary": "summary",
  "data": "data",
  "head": "head",
  "meta": "meta",
  "base": "base",
  "script": "script",
  "noscript": "noscript",
  "embed": "embed",
  "object": "object",
  "param": "param",
};
