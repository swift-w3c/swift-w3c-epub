public import RFC_3987
public import W3C_EPUB_Shared

extension W3C_EPUB.NavigationDocument {

    public struct NavigationItem: Sendable, Hashable {

        public var text: String

        public var href: RFC_3987.IRI.Reference?

        public var children: [NavigationItem]

        public init(
            text: String,
            href: RFC_3987.IRI.Reference? = nil,
            children: [NavigationItem] = []
        ) {
            self.text = text
            self.href = href
            self.children = children
        }
    }
}
