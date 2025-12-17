// W3C EPUB 3.3 — EPUB Publications
// https://www.w3.org/TR/epub-33/#sec-epub-publication-conformance

public import W3C_EPUB_Shared

extension W3C_EPUB {
    /// EPUB Publications conformance and terminology.
    public enum Publications {}
}

// MARK: - Publication

extension W3C_EPUB.Publications {
    /// An EPUB Publication is a collection of resources that constitutes
    /// a single intellectual or artistic work.
    public struct Publication: Sendable, Hashable {
        /// The unique identifier for this publication.
        public var uniqueIdentifier: String

        /// The release identifier combines unique identifier and modification date.
        public var releaseIdentifier: String?

        /// The EPUB version this publication conforms to.
        public var version: W3C_EPUB.Version

        public init(
            uniqueIdentifier: String,
            releaseIdentifier: String? = nil,
            version: W3C_EPUB.Version = .v3_3
        ) {
            self.uniqueIdentifier = uniqueIdentifier
            self.releaseIdentifier = releaseIdentifier
            self.version = version
        }
    }
}

// MARK: - Conformance

extension W3C_EPUB.Publications {
    /// Conformance levels for EPUB Publications.
    public enum ConformanceLevel: String, Sendable, Hashable, CaseIterable {
        /// The publication meets all MUST requirements.
        case conforming

        /// The publication meets all requirements for optimized delivery.
        case optimized
    }
}

// MARK: - Resource Types

extension W3C_EPUB.Publications {
    /// Resource types within an EPUB Publication.
    public enum ResourceType: String, Sendable, Hashable, CaseIterable {
        /// EPUB Content Document (XHTML or SVG)
        case contentDocument

        /// The Package Document (content.opf)
        case packageDocument

        /// The Navigation Document (nav.xhtml)
        case navigationDocument

        /// A CSS Stylesheet
        case stylesheet

        /// An image resource
        case image

        /// An audio resource
        case audio

        /// A video resource
        case video

        /// A font resource
        case font

        /// A script resource
        case script

        /// A foreign resource (requires fallback)
        case foreign
    }
}
