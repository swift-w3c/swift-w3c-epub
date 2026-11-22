public import W3C_EPUB_Shared

extension W3C.EPUB.FixedLayouts {

    public enum RenditionSpread: String, Sendable, Hashable, CaseIterable {

        case auto

        case none

        case landscape

        case both
    }
}
