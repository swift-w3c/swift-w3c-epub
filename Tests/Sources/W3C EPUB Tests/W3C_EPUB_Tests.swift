import Testing
@testable import W3C_EPUB
import BCP_47

@Suite("W3C EPUB Tests")
struct W3C_EPUB_Tests {
    @Test("Version comparison")
    func versionComparison() {
        #expect(W3C_EPUB.Version.v2_0_1 < W3C_EPUB.Version.v3_0)
        #expect(W3C_EPUB.Version.v3_0 < W3C_EPUB.Version.v3_2)
        #expect(W3C_EPUB.Version.v3_2 < W3C_EPUB.Version.v3_3)
    }

    @Test("Media types")
    func mediaTypes() {
        #expect(W3C_EPUB.Media.Kind.epub.rawValue == "application/epub+zip")
        #expect(W3C_EPUB.Media.Kind.package.rawValue == "application/oebps-package+xml")
        #expect(W3C_EPUB.Media.Kind.xhtml.rawValue == "application/xhtml+xml")
    }

    @Test("Package metadata")
    func packageMetadata() throws {
        let metadata = W3C_EPUB.PackageDocument.Metadata(
            identifier: "urn:uuid:12345",
            title: "Test Book",
            language: try BCP47.LanguageTag("en"),
            creators: ["Author One", "Author Two"]
        )

        #expect(metadata.identifier == "urn:uuid:12345")
        #expect(metadata.title == "Test Book")
        #expect(metadata.language.value == "en")
        #expect(metadata.creators.count == 2)
    }

    @Test("Manifest item")
    func manifestItem() {
        let item = W3C_EPUB.PackageDocument.Manifest.Item(
            id: "chapter1",
            href: "text/chapter1.xhtml",
            mediaType: W3C_EPUB.Media.Kind.xhtml.rawValue,
            properties: ["scripted"]
        )

        #expect(item.id == "chapter1")
        #expect(item.properties.contains("scripted"))
    }

    @Test("Navigation item hierarchy")
    func navigationHierarchy() {
        let nav = W3C_EPUB.NavigationDocument.NavigationItem(
            text: "Part 1",
            children: [
                W3C_EPUB.NavigationDocument.NavigationItem(
                    text: "Chapter 1",
                    href: "text/ch1.xhtml"
                ),
                W3C_EPUB.NavigationDocument.NavigationItem(
                    text: "Chapter 2",
                    href: "text/ch2.xhtml"
                ),
            ]
        )

        #expect(nav.children.count == 2)
        #expect(nav.href == nil)
        #expect(nav.children[0].href == "text/ch1.xhtml")
    }

    @Test("Fixed layout viewport")
    func fixedLayoutViewport() {
        let viewport = W3C_EPUB.FixedLayouts.Viewport(width: 1024, height: 768)
        #expect(viewport.metaContent == "width=1024, height=768")
    }

    @Test("OCF container")
    func ocfContainer() {
        let container = W3C_EPUB.OCF.Container(
            rootfiles: [
                W3C_EPUB.OCF.Container.Rootfile(fullPath: "OEBPS/content.opf")
            ]
        )

        #expect(container.rootfiles.count == 1)
        #expect(container.rootfiles[0].mediaType == W3C_EPUB.Media.Kind.package.rawValue)
    }
}
