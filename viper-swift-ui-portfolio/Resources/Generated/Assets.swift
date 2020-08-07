// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let black040303 = ColorAsset(name: "Black040303")
    internal static let black222222 = ColorAsset(name: "Black222222")
    internal static let black262626 = ColorAsset(name: "Black262626")
    internal static let blue284072 = ColorAsset(name: "Blue284072")
    internal static let blue3A599C = ColorAsset(name: "Blue3A599C")
    internal static let blue5686FB = ColorAsset(name: "Blue5686FB")
    internal static let darkGreen = ColorAsset(name: "Dark Green")
    internal static let gray53565C = ColorAsset(name: "Gray53565C")
    internal static let gray8D8F94 = ColorAsset(name: "Gray8D8F94")
    internal static let grayDEDEDE = ColorAsset(name: "GrayDEDEDE")
    internal static let grayE2E2E2 = ColorAsset(name: "GrayE2E2E2")
    internal static let grayECECEC = ColorAsset(name: "GrayECECEC")
    internal static let green1ED660 = ColorAsset(name: "Green1ED660")
    internal static let green26A48B = ColorAsset(name: "Green26A48B")
    internal static let green6EC5A4 = ColorAsset(name: "Green6EC5A4")
    internal static let instructionBlack = ColorAsset(name: "Instruction Black")
    internal static let lightBlack1A1A1A = ColorAsset(name: "Light Black1A1A1A")
    internal static let lightGreen = ColorAsset(name: "Light Green")
    internal static let lightGray217 = ColorAsset(name: "Light gray 217")
    internal static let lightGray = ColorAsset(name: "Light gray")
    internal static let red = ColorAsset(name: "Red")
    internal static let redF13747 = ColorAsset(name: "RedF13747")
    internal static let redFC565F = ColorAsset(name: "RedFC565F")
    internal static let shadowGreen = ColorAsset(name: "Shadow Green")
    internal static let shadow = ColorAsset(name: "Shadow")
    internal static let shadowYellowFEDF8655 = ColorAsset(name: "ShadowYellowFEDF8655")
    internal static let yellowFEDF86 = ColorAsset(name: "YellowFEDF86")
    internal static let green1ED66080 = ColorAsset(name: "green1ED66080")
    internal static let purple50123F = ColorAsset(name: "purple50123F")
    internal static let purple9D578A = ColorAsset(name: "purple9D578A")
  }
  internal enum Image {
    internal static let bg = ImageAsset(name: "BG")
    internal static let group6663 = ImageAsset(name: "Group 6663")
    internal static let group6665 = ImageAsset(name: "Group 6665")
    internal static let facebookbutton = ImageAsset(name: "facebookbutton")
    internal static let googleButton = ImageAsset(name: "googleButton")
    internal static let passwordNotSecured = ImageAsset(name: "passwordNotSecured")
    internal static let passwordSecured = ImageAsset(name: "passwordSecured")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
