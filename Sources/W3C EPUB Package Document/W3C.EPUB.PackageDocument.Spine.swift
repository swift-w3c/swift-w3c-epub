public import W3C_EPUB_Shared

extension W3C.EPUB.PackageDocument {

    public struct Spine: Sendable, Hashable {

        public var toc: String?

        public var itemrefs: [ItemRef]

        public init(toc: String? = nil, itemrefs: [ItemRef] = []) {
            self.toc = toc
            self.itemrefs = itemrefs
        }
    }
}
