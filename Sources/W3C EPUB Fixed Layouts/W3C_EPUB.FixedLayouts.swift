// W3C EPUB 3.3 — Fixed Layouts
// https://www.w3.org/TR/epub-33/#sec-fixed-layouts

public import W3C_EPUB_Shared
public import W3C_EPUB_Package_Document

extension W3C_EPUB {
    /// EPUB Fixed-Layout Documents.
    public enum FixedLayouts {}
}

// MARK: - Rendition Layout

extension W3C_EPUB.FixedLayouts {
    /// The rendition layout property.
    public enum RenditionLayout: String, Sendable, Hashable, CaseIterable {
        /// Reflowable content (default).
        case reflowable

        /// Pre-paginated (fixed-layout) content.
        case prePaginated = "pre-paginated"
    }
}

// MARK: - Rendition Orientation

extension W3C_EPUB.FixedLayouts {
    /// The rendition orientation property.
    public enum RenditionOrientation: String, Sendable, Hashable, CaseIterable {
        /// Content may be rendered in any orientation.
        case auto

        /// Content is optimized for landscape orientation.
        case landscape

        /// Content is optimized for portrait orientation.
        case portrait
    }
}

// MARK: - Rendition Spread

extension W3C_EPUB.FixedLayouts {
    /// The rendition spread property.
    public enum RenditionSpread: String, Sendable, Hashable, CaseIterable {
        /// Synthetic spread behavior is determined by the Reading System.
        case auto

        /// No synthetic spreads should be created.
        case none

        /// Synthetic spreads in landscape mode only.
        case landscape

        /// Synthetic spreads in both orientations.
        case both
    }
}

// MARK: - Page Spread

extension W3C_EPUB.FixedLayouts {
    /// The page-spread property for spine items.
    public enum PageSpread: String, Sendable, Hashable, CaseIterable {
        /// Page appears on the left side of a spread.
        case left = "page-spread-left"

        /// Page appears on the right side of a spread.
        case right = "page-spread-right"

        /// Page is centered (single page spread).
        case center = "page-spread-center"
    }
}

// MARK: - Viewport

extension W3C_EPUB.FixedLayouts {
    /// Fixed-layout viewport dimensions.
    public struct Viewport: Sendable, Hashable {
        /// Viewport width in CSS pixels.
        public var width: Double

        /// Viewport height in CSS pixels.
        public var height: Double

        public init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }

        /// Common fixed-layout viewport sizes.
        public static let kindle = Viewport(width: 1024, height: 768)
        public static let ipad = Viewport(width: 1024, height: 768)
        public static let ipadRetina = Viewport(width: 2048, height: 1536)
        public static let iphone = Viewport(width: 375, height: 667)
    }
}

extension W3C_EPUB.FixedLayouts.Viewport {
    /// The viewport meta tag content string.
    public var metaContent: String {
        "width=\(Int(width)), height=\(Int(height))"
    }
}
