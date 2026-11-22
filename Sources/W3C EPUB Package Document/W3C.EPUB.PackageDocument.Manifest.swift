public import W3C_EPUB_Shared

extension W3C.EPUB.PackageDocument {

    public struct Manifest: Sendable, Hashable {

        public var items: [Item]

        public init(items: [Item] = []) {
            self.items = items
        }
    }
}
