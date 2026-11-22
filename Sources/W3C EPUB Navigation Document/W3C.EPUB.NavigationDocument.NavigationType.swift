public import W3C_EPUB_Shared

extension W3C.EPUB.NavigationDocument {

    public enum NavigationType: String, Sendable, Hashable, CaseIterable {

        case toc

        case pageList = "page-list"

        case landmarks
    }
}
