// W3C EPUB 3.3 — Open Container Format (OCF)
// https://www.w3.org/TR/epub-33/#sec-ocf

public import W3C_EPUB_Shared
public import W3C_EPUB_Package_Document

extension W3C_EPUB {
    /// Open Container Format (OCF) — the ZIP-based container for EPUB.
    public enum OCF {}
}

// MARK: - Container

extension W3C_EPUB.OCF {
    /// The OCF container structure.
    public struct Container: Sendable, Hashable {
        /// The root files (typically one package document).
        public var rootfiles: [Rootfile]

        public init(rootfiles: [Rootfile] = []) {
            self.rootfiles = rootfiles
        }
    }
}

extension W3C_EPUB.OCF.Container {
    /// A rootfile entry in container.xml.
    public struct Rootfile: Sendable, Hashable {
        /// Path to the package document relative to container root.
        public var fullPath: String

        /// Media type (always application/oebps-package+xml for EPUB).
        public var mediaType: String

        public init(
            fullPath: String,
            mediaType: String = W3C_EPUB.Media.Kind.package.rawValue
        ) {
            self.fullPath = fullPath
            self.mediaType = mediaType
        }
    }
}

// MARK: - Reserved Paths

extension W3C_EPUB.OCF {
    /// Reserved file and directory names in OCF.
    public enum ReservedPath: String, Sendable, Hashable, CaseIterable {
        /// The mimetype file (must be first, uncompressed).
        case mimetype

        /// The META-INF directory.
        case metaInf = "META-INF"

        /// The container.xml file.
        case container = "META-INF/container.xml"

        /// The encryption.xml file (optional).
        case encryption = "META-INF/encryption.xml"

        /// The manifest.xml file (optional, for signatures).
        case manifest = "META-INF/manifest.xml"

        /// The metadata.xml file (optional).
        case metadata = "META-INF/metadata.xml"

        /// The rights.xml file (optional).
        case rights = "META-INF/rights.xml"

        /// The signatures.xml file (optional).
        case signatures = "META-INF/signatures.xml"
    }
}

// MARK: - Container XML

extension W3C_EPUB.OCF {
    /// The expected mimetype file content.
    public static let mimetypeContent = "application/epub+zip"

    /// The container.xml namespace.
    public static let containerNamespace = "urn:oasis:names:tc:opendocument:xmlns:container"
}

// MARK: - Zip Compression

extension W3C_EPUB.OCF {
    /// Compression requirements for OCF.
    public enum Compression: Sendable, Hashable {
        /// Store without compression (required for mimetype).
        case stored

        /// Deflate compression (recommended for other files).
        case deflated
    }
}
