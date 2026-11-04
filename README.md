# swift-w3c-epub

Use this package when you need plain Swift values for the parts of an EPUB publication: the package document with its metadata, manifest and spine, the navigation document, fixed-layout properties and the OCF container. Start from `W3C_EPUB.PackageDocument.Package`. This package only holds values. To write the XML files of an EPUB from your own descriptions, use swift-epub-render.

## Laws

- Nothing is checked against anything else. A spine `idref` need not name a manifest item, a manifest `fallback` need not exist, and `W3C_EPUB.PackageDocument.Package.uniqueIdentifier` need not match the metadata `identifier`.
- `W3C_EPUB.Version` orders by major version, then minor. It has no patch number, so `W3C_EPUB.Version.v2_0_1` is version 2.0 and prints as 2.0.
- `W3C_EPUB.FixedLayouts.Viewport.metaContent` writes the width and height as whole numbers, as in `width=1024, height=768`, dropping any fraction.
