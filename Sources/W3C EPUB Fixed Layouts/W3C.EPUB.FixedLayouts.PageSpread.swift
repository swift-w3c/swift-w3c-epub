public import W3C_EPUB_Shared

extension W3C.EPUB.FixedLayouts {

    public enum PageSpread: String, Sendable, Hashable, CaseIterable {

        case left = "page-spread-left"

        case right = "page-spread-right"

        case center = "page-spread-center"
    }
}
