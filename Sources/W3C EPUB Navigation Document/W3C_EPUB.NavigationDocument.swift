// W3C EPUB 3.3 — Navigation Document
// https://www.w3.org/TR/epub-33/#sec-nav

public import W3C_EPUB_Shared
public import W3C_EPUB_Content_Documents

extension W3C_EPUB {
    /// EPUB Navigation Document (nav.xhtml).
    public enum NavigationDocument {}
}

// MARK: - Navigation

extension W3C_EPUB.NavigationDocument {
    /// The Navigation Document provides navigation aids for the publication.
    public struct Navigation: Sendable, Hashable {
        /// The table of contents navigation.
        public var toc: NavigationList

        /// The page list navigation (optional).
        public var pageList: NavigationList?

        /// The landmarks navigation (optional).
        public var landmarks: NavigationList?

        public init(
            toc: NavigationList,
            pageList: NavigationList? = nil,
            landmarks: NavigationList? = nil
        ) {
            self.toc = toc
            self.pageList = pageList
            self.landmarks = landmarks
        }
    }
}

// MARK: - Navigation List

extension W3C_EPUB.NavigationDocument {
    /// A navigation list (nav element with epub:type).
    public struct NavigationList: Sendable, Hashable {
        /// The navigation type (toc, page-list, landmarks).
        public var type: NavigationType

        /// Optional heading for this navigation.
        public var heading: String?

        /// The navigation items.
        public var items: [NavigationItem]

        public init(
            type: NavigationType,
            heading: String? = nil,
            items: [NavigationItem] = []
        ) {
            self.type = type
            self.heading = heading
            self.items = items
        }
    }
}

// MARK: - Navigation Type

extension W3C_EPUB.NavigationDocument {
    /// Navigation list types (epub:type values).
    public enum NavigationType: String, Sendable, Hashable, CaseIterable {
        /// Table of contents.
        case toc

        /// Page list (physical page references).
        case pageList = "page-list"

        /// Landmarks (key locations).
        case landmarks
    }
}

// MARK: - Navigation Item

extension W3C_EPUB.NavigationDocument {
    /// A navigation item (li element containing a or span).
    public struct NavigationItem: Sendable, Hashable {
        /// The display text.
        public var text: String

        /// The href to the content (nil for heading-only items).
        public var href: String?

        /// Child navigation items (for nested lists).
        public var children: [NavigationItem]

        public init(
            text: String,
            href: String? = nil,
            children: [NavigationItem] = []
        ) {
            self.text = text
            self.href = href
            self.children = children
        }
    }
}

// MARK: - Landmark Type

extension W3C_EPUB.NavigationDocument {
    /// Common landmark types (epub:type values for landmarks).
    public enum LandmarkType: String, Sendable, Hashable, CaseIterable {
        case cover
        case titlePage = "title-page"
        case toc
        case bodymatter
        case frontmatter
        case backmatter
        case copyright = "copyright-page"
        case dedication
        case preface
        case foreword
        case introduction
        case acknowledgments
        case appendix
        case glossary
        case bibliography
        case index
        case colophon
    }
}
