public import W3C_EPUB_Shared

extension W3C.EPUB.Publications {

    public enum ResourceType: String, Sendable, Hashable, CaseIterable {

        case contentDocument

        case packageDocument

        case navigationDocument

        case stylesheet

        case image

        case audio

        case video

        case font

        case script

        case foreign
    }
}
