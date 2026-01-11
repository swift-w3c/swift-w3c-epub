// W3C EPUB 3.3 — Electronic Publication Standard
// https://www.w3.org/TR/epub-33/
//
// EPUB 3 defines a distribution and interchange format for digital publications
// and documents. The EPUB format provides a means of representing, packaging,
// and encoding structured and semantically enhanced web content — including HTML,
// CSS, SVG, and other resources — for distribution in a single-file container.

public import Standard_Library_Extensions

/// The root namespace for W3C EPUB 3.3 definitions.
///
/// EPUB 3.3 is a W3C Recommendation that defines a distribution and interchange
/// format for digital publications. This namespace provides Swift types that
/// encode the standard's definitions.
///
/// ## Specification Reference
/// - [EPUB 3.3](https://www.w3.org/TR/epub-33/)
/// - [EPUB Reading Systems 3.3](https://www.w3.org/TR/epub-rs-33/)
/// - [EPUB Accessibility 1.1](https://www.w3.org/TR/epub-a11y-11/)
public enum W3C_EPUB {}

// MARK: - Version

extension W3C_EPUB {
    /// EPUB specification version.
    public struct Version: Sendable, Hashable, Comparable {
        public let major: Int
        public let minor: Int

        public init(major: Int, minor: Int) {
            self.major = major
            self.minor = minor
        }

        /// EPUB 3.3 (W3C Recommendation, May 2023)
        public static let v3_3 = Version(major: 3, minor: 3)

        /// EPUB 3.2 (2019)
        public static let v3_2 = Version(major: 3, minor: 2)

        /// EPUB 3.0 (2011)
        public static let v3_0 = Version(major: 3, minor: 0)

        /// EPUB 2.0.1 (2010)
        public static let v2_0_1 = Version(major: 2, minor: 0)

        public static func < (lhs: Version, rhs: Version) -> Bool {
            if lhs.major != rhs.major {
                return lhs.major < rhs.major
            }
            return lhs.minor < rhs.minor
        }
    }
}

extension W3C_EPUB.Version: CustomStringConvertible {
    public var description: String {
        "\(major).\(minor)"
    }
}

// MARK: - Media

extension W3C_EPUB {
    /// Media types and related definitions.
    public enum Media {}
}

extension W3C_EPUB.Media {
    /// EPUB-defined media types.
    ///
    /// Per EPUB 3.3, Section 2.3.
    public enum Kind: String, Sendable, Hashable, CaseIterable {
        /// EPUB publication media type
        case epub = "application/epub+zip"

        /// EPUB package document media type
        case package = "application/oebps-package+xml"

        /// XHTML content document media type
        case xhtml = "application/xhtml+xml"

        /// SVG content document media type
        case svg = "image/svg+xml"

        /// CSS stylesheet media type
        case css = "text/css"

        /// JavaScript media type
        case javascript = "application/javascript"

        /// NCX navigation (legacy, EPUB 2)
        case ncx = "application/x-dtbncx+xml"

        /// SMIL media overlay
        case smil = "application/smil+xml"

        /// PLS pronunciation lexicon
        case pls = "application/pls+xml"
    }
}
