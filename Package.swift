// swift-tools-version:4.2
import PackageDescription

#if os(OSX)
let gtkUrl = "-Mac"
#elseif os(Linux)
let gtkUrl = "-Linux"
#else
fatalError("Unsupported platform.")
#endif

let package = Package(
        name: "SwiftGtk",
        products: [
            .library(name: "SwiftGtk",
                    targets: ["SwiftGtk"]
            )
            ,
//            .executable(name: "SwiftGtkDemo",
//                    targets: ["SwiftGtkDemo"])
        ],
        targets: [
            .systemLibrary(
                    name: "CGtk",
                    path: "Libraries/CGtk\(gtkUrl)", //gtkPath,
                    pkgConfig: "gtk+-3.0",
                    providers: [.apt(["gtk3.0-dev"]),
                                .brew(["pkg-config", "gtk+3"])]),

            .target(
                    name: "SwiftGtk",
                    dependencies: ["CGtk"],
                    path: "Sources"
            )
//                    ,
//            .target(
//                    name: "SwiftGtkDemo",
//                    dependencies: ["SwiftGtk"],
//                    path: "SwiftGtkDemo"
//            )//,
            //   .testTarget(
            //          name: "SwiftGtkDemoTests",
            //         dependencies: ["SwiftGtkDemo"]
            //    )
        ]

)