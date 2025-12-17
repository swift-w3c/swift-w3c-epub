// W3C EPUB 3.3 — Package Document
// https://www.w3.org/TR/epub-33/#sec-package-doc

public import W3C_EPUB_Shared
public import W3C_EPUB_Publications
public import BCP_47

extension W3C_EPUB {
    /// EPUB Package Document (content.opf).
    public enum PackageDocument {}
}

// MARK: - Package

extension W3C_EPUB.PackageDocument {
    /// The Package Document carries bibliographic and structural metadata
    /// about an EPUB Publication.
    public struct Package: Sendable, Hashable {
        /// The unique identifier reference.
        public var uniqueIdentifier: String

        /// The EPUB version.
        public var version: W3C_EPUB.Version

        /// Package metadata.
        public var metadata: Metadata

        /// The manifest of resources.
        public var manifest: Manifest

        /// The spine (reading order).
        public var spine: Spine

        public init(
            uniqueIdentifier: String,
            version: W3C_EPUB.Version = .v3_3,
            metadata: Metadata,
            manifest: Manifest,
            spine: Spine
        ) {
            self.uniqueIdentifier = uniqueIdentifier
            self.version = version
            self.metadata = metadata
            self.manifest = manifest
            self.spine = spine
        }
    }
}

// MARK: - Metadata

extension W3C_EPUB.PackageDocument {
    /// Package metadata (Dublin Core and EPUB-specific).
    public struct Metadata: Sendable, Hashable {
        /// dc:identifier - Publication identifier.
        public var identifier: String

        /// dc:title - Publication title.
        public var title: String

        /// dc:language - Publication language (BCP 47).
        public var language: BCP47.LanguageTag

        /// dc:creator - Author(s).
        public var creators: [String]

        /// dc:contributor - Contributor(s).
        public var contributors: [String]

        /// dc:publisher - Publisher.
        public var publisher: String?

        /// dc:date - Publication date.
        public var date: String?

        /// dc:description - Description.
        public var description: String?

        /// dc:subject - Subject(s).
        public var subjects: [String]

        /// dcterms:modified - Last modification date.
        public var modified: String?

        public init(
            identifier: String,
            title: String,
            language: BCP47.LanguageTag,
            creators: [String] = [],
            contributors: [String] = [],
            publisher: String? = nil,
            date: String? = nil,
            description: String? = nil,
            subjects: [String] = [],
            modified: String? = nil
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

// MARK: - Manifest

extension W3C_EPUB.PackageDocument {
    /// The manifest lists all resources in the publication.
    public struct Manifest: Sendable, Hashable {
        /// The manifest items.
        public var items: [Item]

        public init(items: [Item] = []) {
            self.items = items
        }
    }
}

extension W3C_EPUB.PackageDocument.Manifest {
    /// A manifest item.
    public struct Item: Sendable, Hashable, Identifiable {
        /// Unique identifier within the manifest.
        public var id: String

        /// Relative path to the resource.
        public var href: String

        /// Media type of the resource.
        public var mediaType: String

        /// Properties (e.g., "nav", "cover-image", "scripted").
        public var properties: Set<String>

        /// Fallback item ID for foreign resources.
        public var fallback: String?

        public init(
            id: String,
            href: String,
            mediaType: String,
            properties: Set<String> = [],
            fallback: String? = nil
        ) {
            self.id = id
            self.href = href
            self.mediaType = mediaType
            self.properties = properties
            self.fallback = fallback
        }
    }
}

// MARK: - Spine

extension W3C_EPUB.PackageDocument {
    /// The spine defines the default reading order.
    public struct Spine: Sendable, Hashable {
        /// Reference to the NCX (for EPUB 2 compatibility).
        public var toc: String?

        /// The spine items.
        public var itemrefs: [ItemRef]

        public init(toc: String? = nil, itemrefs: [ItemRef] = []) {
            self.toc = toc
            self.itemrefs = itemrefs
        }
    }
}

extension W3C_EPUB.PackageDocument.Spine {
    /// A spine itemref.
    public struct ItemRef: Sendable, Hashable {
        /// Reference to a manifest item ID.
        public var idref: String

        /// Whether this item is linear (part of main reading order).
        public var linear: Bool

        /// Properties for this spine item.
        public var properties: Set<String>

        public init(
            idref: String,
            linear: Bool = true,
            properties: Set<String> = []
        ) {
            self.idref = idref
            self.linear = linear
            self.properties = properties
        }
    }
}
