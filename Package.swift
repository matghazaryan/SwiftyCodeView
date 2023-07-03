// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyCodeView",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SwiftyCodeView", targets: ["SwiftyCodeView"]),
    ],
    targets: [
        .target(
            name: "SwiftyCodeView",
            path: "SwiftyCodeView/Classes"
        )
    ],
    swiftLanguageVersions: [.v5]
)
