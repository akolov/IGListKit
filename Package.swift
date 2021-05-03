// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IGListKit",
    platforms: [
        .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "IGListKit", targets: ["IGListKit"]),
        .library(name: "IGListDiffKit", targets: ["IGListDiffKit"]),
        .library(name: "IGListSwiftKit", targets: ["IGListSwiftKit"])
    ],
    targets: [
        .target(
            name: "IGListKit",
            dependencies: [
                "IGListDiffKit"
            ],
            path: "Source/IGListKit",
            publicHeadersPath: "Include",
            cSettings: [
                .define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release)),
                .headerSearchPath("."),
                .headerSearchPath(".."),
                .headerSearchPath("../.."),
                .headerSearchPath("Internal"),
                .headerSearchPath("../Internal"),
                .headerSearchPath("../../Internal"),
                .headerSearchPath("../IGListDiffKit"),
                .headerSearchPath("../IGListDiffKit/Internal"),
                .headerSearchPath("../../IGListDiffKit/Internal"),
                .headerSearchPath("../../IGListDiffKit/Include"),
            ]
        ),
        .target(
            name: "IGListDiffKit",
            path: "Source/IGListDiffKit",
            publicHeadersPath: "Include",
            cSettings: [
                .define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release)),
                .headerSearchPath("."),
                .headerSearchPath(".."),
                .headerSearchPath("../.."),
                .headerSearchPath("Internal"),
                .headerSearchPath("../Internal"),
                .headerSearchPath("../../Internal")
            ]
        ),
        .target(
            name: "IGListSwiftKit",
            dependencies: [
                "IGListDiffKit",
                "IGListKit"
            ],
            path: "Source/IGListSwiftKit"
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
