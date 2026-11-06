public import BCP_47
public import W3C_EPUB_Shared

extension W3C_EPUB.ContentDocuments {

    public struct XHTMLDocument: Sendable, Hashable {

        // swift-linter:disable:next raw concept
        // REASON: A content document's name inside the EPUB container, text the OCF format defines and not a path on this file system, as a ZIP entry name is; looked at Path and Path.Component, which hold this platform's names.
        public var filename: String

        public var title: String?

        public var language: BCP47.LanguageTag?

        public var isScripted: Bool

        public init(
            // swift-linter:disable:next raw concept
            // REASON: A content document's name inside the EPUB container, text the OCF format defines and not a path on this file system, as a ZIP entry name is; looked at Path and Path.Component, which hold this platform's names.
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
