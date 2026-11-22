public import W3C_EPUB_Shared

extension W3C.EPUB.PackageDocument {

    public struct Package: Sendable, Hashable {

        public var uniqueIdentifier: String

        public var version: W3C.EPUB.Version

        public var metadata: Metadata

        public var manifest: Manifest

        public var spine: Spine

        public init(
            uniqueIdentifier: String,
            version: W3C.EPUB.Version = .v3_3,
            metadata: Metadata,
            manifest: Manifest,
            spine: Spine
        ) {
            self.uniqueIdentifier = uniqueIdentifier
            self.version = version
            self.metadata = metadata
            self.manifest = manifest
            self.spine = spine
        }
    }
}
