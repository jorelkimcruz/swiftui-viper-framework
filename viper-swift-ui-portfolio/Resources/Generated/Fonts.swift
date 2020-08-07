// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum BrandonGrotesque {
    internal static let black = FontConvertible(name: "BrandonGrotesque-Black", family: "Brandon Grotesque", path: "Brandon_blk.otf")
    internal static let blackItalic = FontConvertible(name: "BrandonGrotesque-BlackItalic", family: "Brandon Grotesque", path: "Brandon_blk_it.otf")
    internal static let bold = FontConvertible(name: "BrandonGrotesque-Bold", family: "Brandon Grotesque", path: "Brandon_bld.otf")
    internal static let boldItalic = FontConvertible(name: "BrandonGrotesque-BoldItalic", family: "Brandon Grotesque", path: "Brandon_bld_it.otf")
    internal static let light = FontConvertible(name: "BrandonGrotesque-Light", family: "Brandon Grotesque", path: "Brandon_light.otf")
    internal static let lightItalic = FontConvertible(name: "BrandonGrotesque-LightItalic", family: "Brandon Grotesque", path: "Brandon_light_it.otf")
    internal static let medium = FontConvertible(name: "BrandonGrotesque-Medium", family: "Brandon Grotesque", path: "Brandon_med.otf")
    internal static let mediumItalic = FontConvertible(name: "BrandonGrotesque-MediumItalic", family: "Brandon Grotesque", path: "Brandon_med_it.otf")
    internal static let regular = FontConvertible(name: "BrandonGrotesque-Regular", family: "Brandon Grotesque", path: "Brandon_reg.otf")
    internal static let regularItalic = FontConvertible(name: "BrandonGrotesque-RegularItalic", family: "Brandon Grotesque", path: "Brandon_reg_it.otf")
    internal static let thin = FontConvertible(name: "BrandonGrotesque-Thin", family: "Brandon Grotesque", path: "Brandon_thin.otf")
    internal static let thinItalic = FontConvertible(name: "BrandonGrotesque-ThinItalic", family: "Brandon Grotesque", path: "Brandon_thin_it.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal enum NeutraText {
    internal static let bold = FontConvertible(name: "NeutraText-Bold", family: "Neutra Text", path: "NeutraText-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "NeutraText-BoldItalic", family: "Neutra Text", path: "NeutraText-BoldItalic.otf")
    internal static let book = FontConvertible(name: "NeutraText-Book", family: "Neutra Text", path: "NeutraText-Book.otf")
    internal static let bookItalic = FontConvertible(name: "NeutraText-BookItalic", family: "Neutra Text", path: "NeutraText-BookItalic.otf")
    internal static let all: [FontConvertible] = [bold, boldItalic, book, bookItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [BrandonGrotesque.all, NeutraText.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

private final class BundleToken {}
