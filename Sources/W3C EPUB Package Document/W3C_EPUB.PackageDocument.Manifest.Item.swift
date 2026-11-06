public import RFC_3987
public import RFC_9110
public import W3C_EPUB_Shared

extension W3C_EPUB.PackageDocument.Manifest {

    public struct Item: Sendable, Hashable, Identifiable {

        public var id: String

        public var href: RFC_3987.IRI.Reference

        public var mediaType: RFC_9110.MediaType

        public var properties: Set<String>

        public var fallback: String?

        public init(
            id: String,
            href: RFC_3987.IRI.Reference,
            mediaType: RFC_9110.MediaType,
            properties: Set<String> = [],
            fallback: String? = nil
        ) {
            self.id = id
            self.href = href
            self.mediaType = mediaType
            self.properties = properties
            self.fallback = fallback
        }
    }
}
