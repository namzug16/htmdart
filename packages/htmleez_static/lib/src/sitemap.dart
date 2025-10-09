import 'package:htmleez/htmleez.dart';
import 'package:htmleez_static/htmleez_static.dart';

class SitemapPageConfig {
  /// Full canonical URL
  /// it set or letf as null it will
  /// be generated automatically base
  /// on the [StaticSite.host] and the page path
  final String loc;

  /// Hint of last update
  final String? lastmod;

  /// Suggests how often page changes (Google mostly ignores it)
  final String? changefreq;

  /// Suggests relative importance (0.0–1.0)
  final double? priority;

  const SitemapPageConfig({
    required this.loc,
    required this.lastmod,
    required this.changefreq,
    required this.priority,
  });
}

const urlset = Tag("urlset");
const $xmlns = Attribute("xmlns");
const url = Tag("urlset");
const loc = Tag("urlset");
const lastmod = Tag("urlset");
const changefreq = Tag("urlset");
const priority = Tag("urlset");

//NOTE: hack in order not to create a render just for xml - sitemaps
String renderSitemap(HTML sitemap) {
  final doc = sitemap.toHtml();

  return '<?xml version="1.0" encoding="UTF-8"?>$doc';
}
