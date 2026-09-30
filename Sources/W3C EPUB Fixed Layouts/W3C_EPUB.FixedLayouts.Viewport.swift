public import W3C_EPUB_Shared

extension W3C_EPUB.FixedLayouts {

    public struct Viewport: Sendable, Hashable {

        public var width: Double

        public var height: Double

        public init(width: Double, height: Double) {
            precondition(width.isFinite && height.isFinite, "EPUB viewport size must be finite: \(width) × \(height)")
            self.width = width
            self.height = height
        }
    }
}

extension W3C_EPUB.FixedLayouts.Viewport {

    public static let kindle = W3C_EPUB.FixedLayouts.Viewport(width: 1024, height: 768)
    public static let ipad = W3C_EPUB.FixedLayouts.Viewport(width: 1024, height: 768)
    public static let ipadRetina = W3C_EPUB.FixedLayouts.Viewport(width: 2048, height: 1536)
    public static let iphone = W3C_EPUB.FixedLayouts.Viewport(width: 375, height: 667)

    public var metaContent: String {
        precondition(width.isFinite && height.isFinite, "EPUB viewport size must be finite: \(width) × \(height)")
        return "width=\(Int(width)), height=\(Int(height))"
    }
}
