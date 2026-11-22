public import W3C_EPUB_Shared

extension W3C.EPUB.Publications {

    public enum ConformanceLevel: String, Sendable, Hashable, CaseIterable {

        case conforming

        case optimized
    }
}
