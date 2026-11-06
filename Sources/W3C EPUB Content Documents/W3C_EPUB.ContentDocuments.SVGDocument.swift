public import W3C_EPUB_Shared

extension W3C_EPUB.ContentDocuments {

    public struct SVGDocument: Sendable, Hashable {

        // swift-linter:disable:next raw concept
        // REASON: A content document's name inside the EPUB container, text the OCF format defines and not a path on this file system, as a ZIP entry name is; looked at Path and Path.Component, which hold this platform's names.
        public var filename: String

        public var viewportWidth: Double?

        public var viewportHeight: Double?

        public init(
            // swift-linter:disable:next raw concept
            // REASON: A content document's name inside the EPUB container, text the OCF format defines and not a path on this file system, as a ZIP entry name is; looked at Path and Path.Component, which hold this platform's names.
            filename: String,
            viewportWidth: Double? = nil,
            viewportHeight: Double? = nil
        ) {
            self.filename = filename
            self.viewportWidth = viewportWidth
            self.viewportHeight = viewportHeight
        }
    }
}
