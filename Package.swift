// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PinnedConstraints",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PinnedConstraints",
            targets: ["PinnedConstraints"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PinnedConstraints",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit"),
            ]),
        .testTarget(
            name: "PinnedConstraintsTests",
            dependencies: ["PinnedConstraints"]),
    ]
)