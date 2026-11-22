public import RFC_9110
public import W3C_EPUB_Shared

extension W3C.EPUB.OCF.Container {

    public struct Rootfile: Sendable, Hashable {

        public var fullPath: String

        public var mediaType: IETF.RFC.`9110`.MediaType

        public init(
            fullPath: String,
            mediaType: IETF.RFC.`9110`.MediaType = W3C.EPUB.Media.Kind.package.mediaType
        ) {
            self.fullPath = fullPath
            self.mediaType = mediaType
        }
    }
}
