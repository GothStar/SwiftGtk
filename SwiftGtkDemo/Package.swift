// swift-tools-version:4.2

import PackageDescription

let package = Package(
        name:  "SwiftGtkDemo",
        products: [
            .executable(name: "SwiftGtkDemo",
                    targets: ["SwiftGtkDemo"])
        ],
        dependencies: [
            .package(path: "../")
        ],
        targets: [
            .target(name: "SwiftGtkDemo",
                    dependencies: ["SwiftGtk"],
                    path: "Sources")

        ]
)