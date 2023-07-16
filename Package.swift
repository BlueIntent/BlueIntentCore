// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BlueIntentCore",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v11),
    .macOS(.v10_13),
    .tvOS(.v11),
    .watchOS(.v4)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "BlueIntentCore",
      targets: ["BlueIntentCore"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "BlueIntentCore",
      path: "BlueIntentCore"),
//    .executableTarget(name: "BlueIntentCore_Example",
//                      dependencies: ["BlueIntentCore"],
//                      path: "Example/BlueIntentCore"),
    .testTarget(name: "BlueIntentCoreTests",
                dependencies: ["BlueIntentCore"],
                path: "Example/Tests")
  ],
  swiftLanguageVersions: [.v5]
)
