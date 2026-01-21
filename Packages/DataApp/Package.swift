// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DataApp",
    platforms: [
        .iOS(.v15) // Moya için önerilir
    ],
    products: [
        .library(
            name: "DataApp",
            targets: ["DataApp"]
        ),
    ],
    dependencies: [
        // 🔗 Moya Dependency
        .package(
            url: "https://github.com/Moya/Moya.git",
            from: "15.0.0"
        )
    ],
    targets: [
        .target(
            name: "DataApp",
            dependencies: [
                .product(name: "Moya", package: "Moya")
            ]
        ),
        .testTarget(
            name: "DataAppTests",
            dependencies: ["DataApp"]
        ),
    ]
)

