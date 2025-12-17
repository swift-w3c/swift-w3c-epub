// W3C EPUB 3.3 — Content Documents
// https://www.w3.org/TR/epub-33/#sec-contentdocs

public import W3C_EPUB_Shared
public import W3C_EPUB_Publications

extension W3C_EPUB {
    /// EPUB Content Documents (XHTML and SVG).
    public enum ContentDocuments {}
}

// MARK: - XHTML Content Document

extension W3C_EPUB.ContentDocuments {
    /// An XHTML Content Document.
    ///
    /// XHTML Content Documents are XHTML documents that conform to the HTML
    /// specification and the additional requirements defined in EPUB 3.3.
    public struct XHTMLDocument: Sendable, Hashable {
        /// The document's filename within the container.
        public var filename: String

        /// The document's title (from <title> element).
        public var title: String?

        /// The document's language (from xml:lang or lang attribute).
        public var language: String?

        /// Whether this document is a scripted content document.
        public var isScripted: Bool

        public init(
            filename: String,
            title: String? = nil,
            language: String? = nil,
            isScripted: Bool = false
        ) {
            self.filename = filename
            self.title = title
            self.language = language
            self.isScripted = isScripted
        }
    }
}

// MARK: - SVG Content Document

extension W3C_EPUB.ContentDocuments {
    /// An SVG Content Document.
    ///
    /// SVG Content Documents are SVG documents that appear in the spine
    /// or are embedded in XHTML Content Documents.
    public struct SVGDocument: Sendable, Hashable {
        /// The document's filename within the container.
        public var filename: String

        /// The viewport width.
        public var viewportWidth: Double?

        /// The viewport height.
        public var viewportHeight: Double?

        public init(
            filename: String,
            viewportWidth: Double? = nil,
            viewportHeight: Double? = nil
        ) {
            self.filename = filename
            self.viewportWidth = viewportWidth
            self.viewportHeight = viewportHeight
        }
    }
}

// MARK: - Stylesheet

extension W3C_EPUB.ContentDocuments {
    /// A CSS Stylesheet resource.
    public struct Stylesheet: Sendable, Hashable {
        /// The stylesheet's filename within the container.
        public var filename: String

        public init(filename: String) {
            self.filename = filename
        }
    }
}
