public import BCP_47
public import ISO_8601
public import W3C_EPUB_Shared

extension W3C.EPUB.PackageDocument {

    public struct Metadata: Sendable, Hashable {

        public var identifier: String

        public var title: String

        public var language: BCP47.LanguageTag

        public var creators: [String]

        public var contributors: [String]

        public var publisher: String?

        public var date: ISO.`8601`.CalendarDate.Reduced?

        public var description: String?

        public var subjects: [String]

        public var modified: ISO.`8601`.DateTime?

        public init(
            identifier: String,
            title: String,
            language: BCP47.LanguageTag,
            creators: [String] = [],
            contributors: [String] = [],
            publisher: String? = nil,
            date: ISO.`8601`.CalendarDate.Reduced? = nil,
            description: String? = nil,
            subjects: [String] = [],
            modified: ISO.`8601`.DateTime? = nil
        ) {
            self.identifier = identifier
            self.title = title
            self.language = language
            self.creators = creators
            self.contributors = contributors
            self.publisher = publisher
            self.date = date
            self.description = description
            self.subjects = subjects
            self.modified = modified
        }
    }
}
