import 'dart:io';
import 'package:htmleez/htmleez.dart';
import 'package:htmleez_static/src/sitemap.dart' as sitemap;

enum AssetSyncStrategy { none, copy, symlink }

class StaticSite {
  StaticSite(
    this.host,
    this.outputDir, {
    this.assetsDir,
    this.assetStrategy = AssetSyncStrategy.copy,
    this.assetIgnores = const {'.DS_Store'},
  });

  final String host;
  final String outputDir;

  /// Optional folder whose contents should appear in [outputDir].
  /// e.g. `public/`, `static/`, etc.
  final String? assetsDir;

  /// How to bring assets into [outputDir].
  final AssetSyncStrategy assetStrategy;

  /// Filenames to ignore (exact match).
  final Set<String> assetIgnores;

  final List<(String, HTML, sitemap.SitemapPageConfig)> _pages = [];
  HTML? _notFound;

  void page(String path, HTML html, [sitemap.SitemapPageConfig? sitemapConfig]) {
    _checkPath(path);
    final smc =
        sitemapConfig ??
        sitemap.SitemapPageConfig(
          loc: 'https://$host$path',
          lastmod: null,
          changefreq: null,
          priority: null,
        );
    _pages.add((path, html, smc));
  }

  void notFoundPage(HTML page) {
    _notFound = page;
  }

  String _sitemap() {
    final sm = sitemap.urlset([sitemap.$xmlns("http://www.sitemaps.org/schemas/sitemap/0.9")]);
    for (final p in _pages) {
      sm.add(
        sitemap.url([
          sitemap.loc([p.$3.loc.t]),
          if (p.$3.lastmod != null) sitemap.lastmod([p.$3.lastmod!.t]),
          if (p.$3.changefreq != null) sitemap.changefreq([p.$3.changefreq!.t]),
          if (p.$3.priority != null) sitemap.priority([p.$3.priority!.toString().t]),
        ]),
      );
    }
    return sitemap.renderSitemap(sm);
  }

  void call() {
    final outDir = Directory(outputDir)..createSync(recursive: true);

    // 0) Bring in static assets first so generated pages can overwrite if needed.
    _syncAssets();

    // 1) Write each page to index.html
    for (final (path, html, _) in _pages) {
      final filePath = (path == "/") ? "${outDir.path}/index.html" : "${outDir.path}$path/index.html";
      Directory(filePath.substring(0, filePath.lastIndexOf('/'))).createSync(recursive: true);
      File(filePath).writeAsStringSync(html.toHtml());
    }

    // 2) Write sitemap.xml
    File("${outDir.path}/sitemap.xml").writeAsStringSync(_sitemap());

    // 3) Write 404.html if set
    if (_notFound != null) {
      File("${outDir.path}/404.html").writeAsStringSync(_notFound!.toHtml());
    }
  }

  void _syncAssets() {
    if (assetsDir == null || assetStrategy == AssetSyncStrategy.none) return;
    final src = Directory(assetsDir!);
    if (!src.existsSync()) return;

    for (final entity in src.listSync(recursive: true, followLinks: false)) {
      if (entity is! File) continue;
      final name = entity.uri.pathSegments.isEmpty ? '' : entity.uri.pathSegments.last;
      if (assetIgnores.contains(name)) continue;

      final relPath = entity.path.substring(src.path.length).replaceAll('\\', '/');
      final destPath = "${Directory(outputDir).path}$relPath";
      final destDir = Directory(destPath.substring(0, destPath.lastIndexOf('/')));
      destDir.createSync(recursive: true);

      switch (assetStrategy) {
        case AssetSyncStrategy.copy:
          // Skip unchanged (mtime + size heuristic).
          final destFile = File(destPath);
          final srcStat = entity.statSync();
          if (destFile.existsSync()) {
            final dstStat = destFile.statSync();
            final sameSize = srcStat.size == dstStat.size;
            final sameMtime = !srcStat.modified.isAfter(dstStat.modified);
            if (sameSize && sameMtime) break; // looks unchanged
          }
          entity.copySync(destPath);
          break;

        case AssetSyncStrategy.symlink:
          // Replace existing file/symlink with a symlink to source.
          final link = Link(destPath);
          if (File(destPath).existsSync()) File(destPath).deleteSync();
          if (link.existsSync()) link.deleteSync();
          // On Windows, symlink creation may need admin/dev mode; handle failures gracefully.
          try {
            link.createSync(entity.path, recursive: true);
          } catch (_) {
            // Fallback to copy if symlink is not permitted.
            entity.copySync(destPath);
          }
          break;

        case AssetSyncStrategy.none:
          // handled by early return
          break;
      }
    }
  }
}

void _checkPath(String path) {
  if (!path.startsWith("/")) throw ArgumentError.value(path, "path", "expected path to start with a slash");
  if (path != "/" && path.endsWith("/")) {
    throw ArgumentError.value(path, "path", "expected path to not end with a slash");
  }
}
