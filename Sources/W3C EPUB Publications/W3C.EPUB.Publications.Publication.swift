public import W3C_EPUB_Shared

extension W3C.EPUB.Publications {

    public struct Publication: Sendable, Hashable {

        public var uniqueIdentifier: String

        public var releaseIdentifier: String?

        public var version: W3C.EPUB.Version

        public init(
            uniqueIdentifier: String,
            releaseIdentifier: String? = nil,
            version: W3C.EPUB.Version = .v3_3
        ) {
            self.uniqueIdentifier = uniqueIdentifier
            self.releaseIdentifier = releaseIdentifier
            self.version = version
        }
    }
}
