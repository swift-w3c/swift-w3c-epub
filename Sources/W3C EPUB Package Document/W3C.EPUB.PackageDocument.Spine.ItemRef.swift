public import W3C_EPUB_Shared

extension W3C.EPUB.PackageDocument.Spine {

    public struct ItemRef: Sendable, Hashable {

        public var idref: String

        public var linear: Bool

        public var properties: Set<String>

        public init(
            idref: String,
            linear: Bool = true,
            properties: Set<String> = []
        ) {
            self.idref = idref
            self.linear = linear
            self.properties = properties
        }
    }
}
