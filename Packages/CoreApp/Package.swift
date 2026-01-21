// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "CoreApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CoreApp",
            targets: ["CoreApp"]
        ),
    ],
    dependencies: [
        // 🔗 DomainApp dependency (local package)
        .package(path: "../DomainApp")
    ],
    targets: [
        .target(
            name: "CoreApp",
            dependencies: [
                .product(name: "DomainApp", package: "DomainApp")
            ]
        ),
        .testTarget(
            name: "CoreAppTests",
            dependencies: ["CoreApp"]
        ),
    ]
)

