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
            cSettings: [
                .unsafeFlags(["-Wno-shorten-64-to-32"]),
                .define("Z_HAVE_UNISTD_H", .when(platforms: [.macOS, .linux])),
                .define("HAVE_STDARG_H"),
                .define("HAVE_HIDDEN"),
                .define("_CRT_SECURE_NO_DEPRECATE", .when(platforms: [.windows])),
                .define("_CRT_NONSTDC_NO_DEPRECATE", .when(platforms: [.windows])),
            ]),
        .testTarget(
            name: "CZlibTests",
            dependencies: ["CZlib"]),
    ]
)
