public import W3C_EPUB_Shared

extension W3C.EPUB.OCF {

    public struct Container: Sendable, Hashable {

        public var rootfiles: [Rootfile]

        public init(rootfiles: [Rootfile] = []) {
            self.rootfiles = rootfiles
        }
    }
}
