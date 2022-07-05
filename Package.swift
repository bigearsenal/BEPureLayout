// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BEPureLayout",
    platforms: [
//        .macOS(.v10_12),
        .iOS(.v12),
//        .tvOS(.v10),
//        .watchOS(.v3)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BEPureLayout",
            targets: ["BEPureLayout"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/PureLayout/PureLayout.git", .exact("3.1.8")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BEPureLayout",
            dependencies: ["PureLayout"],
            resources: [.process("Sources/BEPureLayout/Resources")]
        ),
        .testTarget(
            name: "BEPureLayoutTests",
            dependencies: ["BEPureLayout"]),
    ]
)
