import Testing
import W3C_EPUB_Shared

@testable import W3C_EPUB_Fixed_Layouts

@Suite
struct `Viewport finite size` {
    @Test
    func `a viewport with a non-finite size is refused when it is created`() async {
        await #expect(processExitsWith: .failure) {
            _ = W3C_EPUB.FixedLayouts.Viewport(width: .nan, height: 600)
        }
    }

    @Test
    func `a finite viewport writes its meta content`() {
        #expect(W3C_EPUB.FixedLayouts.Viewport(width: 375, height: 667).metaContent == "width=375, height=667")
    }
}
