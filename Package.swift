// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CZlib",
    products: [
        .library(
            name: "CZlib",
            targets: ["CZlib"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CZlib",
            publicHeadersPath: "include",
            cSettings: [.define("Z_HAVE_UNISTD_H", .when(platforms: [.macOS, .linux])),
                        .define("HAVE_STDARG_H"),
                        .define("HAVE_HIDDEN")]),
        .testTarget(
            name: "CZlibTests",
            dependencies: ["CZlib"]),
    ]
)


