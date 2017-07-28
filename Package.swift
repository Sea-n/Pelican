import PackageDescription

let package = Package(
    name: "Pelican",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/fluent-provider.git", majorVersion: 1)
    ],
    exclude: []
)

