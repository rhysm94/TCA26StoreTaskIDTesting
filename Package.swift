// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TCA26StoreTaskIDTesting",
  platforms: [.macOS(.v26)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "TCA26StoreTaskIDTesting",
      targets: ["TCA26StoreTaskIDTesting"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/TCA26", branch: "main"),
    .package(
      url: "https://github.com/pointfreeco/swift-debug-snapshots",
      branch: "main",
      traits: [
        "IdentifiedCollections"
      ]
    )
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "TCA26StoreTaskIDTesting",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "TCA26")
      ]
    ),
    .testTarget(
      name: "TCA26StoreTaskIDTestingTests",
      dependencies: [
        "TCA26StoreTaskIDTesting"
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
