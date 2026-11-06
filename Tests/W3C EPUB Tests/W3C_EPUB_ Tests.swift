import BCP_47
import RFC_3987
import RFC_9110
import Testing
import W3C_EPUB_Fixed_Layouts
import W3C_EPUB_Navigation_Document
import W3C_EPUB_Open_Container_Format
import W3C_EPUB_Package_Document
import W3C_EPUB_Shared

@Suite("W3C EPUB Tests")
struct W3C_EPUB_Tests {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}

    @Test
    func `Version comparison`() {
        #expect(W3C_EPUB.Version.v2_0_1 < W3C_EPUB.Version.v3_0)
        #expect(W3C_EPUB.Version.v3_0 < W3C_EPUB.Version.v3_2)
        #expect(W3C_EPUB.Version.v3_2 < W3C_EPUB.Version.v3_3)
    }

    @Test
    func `Media types`() {
        #expect(W3C_EPUB.Media.Kind.epub.rawValue == "application/epub+zip")
        #expect(W3C_EPUB.Media.Kind.package.rawValue == "application/oebps-package+xml")
        #expect(W3C_EPUB.Media.Kind.xhtml.rawValue == "application/xhtml+xml")
    }

    @Test
    func `Package metadata`() throws {
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

    @Test
    func `Manifest item`() throws {
        let item = W3C_EPUB.PackageDocument.Manifest.Item(
            id: "chapter1",
            href: try RFC_3987.IRI.Reference("text/chapter1.xhtml"),
            mediaType: W3C_EPUB.Media.Kind.xhtml.mediaType,
            properties: ["scripted"]
        )

        #expect(item.id == "chapter1")
        #expect(item.properties.contains("scripted"))
    }

    @Test
    func `Navigation item hierarchy`() throws {
        let nav = W3C_EPUB.NavigationDocument.NavigationItem(
            text: "Part 1",
            children: [
                W3C_EPUB.NavigationDocument.NavigationItem(
                    text: "Chapter 1",
                    href: try RFC_3987.IRI.Reference("text/ch1.xhtml")
                ),
                W3C_EPUB.NavigationDocument.NavigationItem(
                    text: "Chapter 2",
                    href: try RFC_3987.IRI.Reference("text/ch2.xhtml")
                ),
            ]
        )

        #expect(nav.children.count == 2)
        #expect(nav.href == nil)
        #expect(nav.children[0].href?.value == "text/ch1.xhtml")
    }

    @Test
    func `Fixed layout viewport`() {
        let viewport = W3C_EPUB.FixedLayouts.Viewport(width: 1024, height: 768)
        #expect(viewport.metaContent == "width=1024, height=768")
    }

    @Test
    func `OCF container`() {
        let container = W3C_EPUB.OCF.Container(
            rootfiles: [
                W3C_EPUB.OCF.Container.Rootfile(fullPath: "OEBPS/content.opf")
            ]
        )

        #expect(container.rootfiles.count == 1)
        #expect(container.rootfiles[0].mediaType == W3C_EPUB.Media.Kind.package.mediaType)
    }
}
