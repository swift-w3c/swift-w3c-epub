public import W3C_EPUB_Shared

extension W3C.EPUB.NavigationDocument {

    public enum LandmarkType: String, Sendable, Hashable, CaseIterable {
        case cover
        case titlePage = "title-page"
        case toc
        case bodymatter
        case frontmatter
        case backmatter
        case copyright = "copyright-page"
        case dedication
        case preface
        case foreword
        case introduction
        case acknowledgments
        case appendix
        case glossary
        case bibliography
        case index
        case colophon
    }
}
