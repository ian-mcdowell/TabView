// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabView",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "TabView",targets: ["TabView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TabView",
            dependencies: [],
            // this manually specifies the path to not break the code with the existing project files but it generates a warning
            // ToDo: Check the warning and find a way to silence it 
            path: "Sources" 
            ),
        // ToDo: Add Tests, fix error and uncomment lines below
        // .testTarget(
        //     name: "TabViewTests",
        //     dependencies: ["TabView"],
        //     path: "Tests/TabViewTests"),
    ]
)
