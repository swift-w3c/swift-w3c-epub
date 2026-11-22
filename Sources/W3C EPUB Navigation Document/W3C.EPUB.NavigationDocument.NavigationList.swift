public import W3C_EPUB_Shared

extension W3C.EPUB.NavigationDocument {

    public struct NavigationList: Sendable, Hashable {

        public var type: NavigationType

        public var heading: String?

        public var items: [NavigationItem]

        public init(
            type: NavigationType,
            heading: String? = nil,
            items: [NavigationItem] = []
        ) {
            self.type = type
            self.heading = heading
            self.items = items
        }
    }
}
