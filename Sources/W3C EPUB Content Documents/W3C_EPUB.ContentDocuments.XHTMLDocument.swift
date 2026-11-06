public import BCP_47
public import W3C_EPUB_Shared

extension W3C_EPUB.ContentDocuments {

    public struct XHTMLDocument: Sendable, Hashable {

        public var filename: String

        public var title: String?

        public var language: BCP47.LanguageTag?

        public var isScripted: Bool

        public init(
            filename: String,
            title: String? = nil,
            language: BCP47.LanguageTag? = nil,
            isScripted: Bool = false
        ) {
            self.filename = filename
            self.title = title
            self.language = language
            self.isScripted = isScripted
        }
    }
}
