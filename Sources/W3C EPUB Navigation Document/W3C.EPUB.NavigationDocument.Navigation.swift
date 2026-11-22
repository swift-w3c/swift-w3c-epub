public import W3C_EPUB_Shared

extension W3C.EPUB.NavigationDocument {

    public struct Navigation: Sendable, Hashable {

        public var toc: NavigationList

        public var pageList: NavigationList?

        public var landmarks: NavigationList?

        public init(
            toc: NavigationList,
            pageList: NavigationList? = nil,
            landmarks: NavigationList? = nil
        ) {
            self.toc = toc
            self.pageList = pageList
            self.landmarks = landmarks
        }
    }
}
