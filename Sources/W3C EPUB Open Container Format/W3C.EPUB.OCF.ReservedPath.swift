public import W3C_EPUB_Shared

extension W3C.EPUB.OCF {

    public enum ReservedPath: String, Sendable, Hashable, CaseIterable {

        case mimetype

        case metaInf = "META-INF"

        case container = "META-INF/container.xml"

        case encryption = "META-INF/encryption.xml"

        case manifest = "META-INF/manifest.xml"

        case metadata = "META-INF/metadata.xml"

        case rights = "META-INF/rights.xml"

        case signatures = "META-INF/signatures.xml"
    }
}

extension W3C.EPUB.OCF {

    public static let mimetypeContent = "application/epub+zip"

    public static let containerNamespace = "urn:oasis:names:tc:opendocument:xmlns:container"
}
