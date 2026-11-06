public import RFC_9110

extension W3C_EPUB.Media {

    public enum Kind: String, Sendable, Hashable, CaseIterable {

        case epub = "application/epub+zip"

        case package = "application/oebps-package+xml"

        case xhtml = "application/xhtml+xml"

        case svg = "image/svg+xml"

        case css = "text/css"

        case javascript = "application/javascript"

        case ncx = "application/x-dtbncx+xml"

        case smil = "application/smil+xml"

        case pls = "application/pls+xml"
    }
}

extension W3C_EPUB.Media.Kind {

    public var mediaType: RFC_9110.MediaType {
        let names = rawValue.split(separator: "/")
        return RFC_9110.MediaType(String(names[0]), String(names[1]))
    }
}
