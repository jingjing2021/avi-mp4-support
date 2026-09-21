// swift-tools-version: 5.9
import PackageDescription
let package = Package(name: "AVIConverterLibraries", platforms: [.iOS(.v17)], products: [.library(name: "FFmpeg-Kit", type: .dynamic, targets: ["FFmpeg-Kit"])], targets: [
.target(name: "FFmpeg-Kit", dependencies: ["ffmpegkit", "libavcodec", "libavdevice", "libavfilter", "libavformat", "libavutil", "libswresample", "libswscale"]),
        .binaryTarget(name: "ffmpegkit", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/ffmpegkit.xcframework.zip", checksum: "46a69b396d97c90ac852e9e53297441c3f706584186c47bb5fbac9e139916e3e"),
        .binaryTarget(name: "libavcodec", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libavcodec.xcframework.zip", checksum: "9a8937c2aeaca163a081b8832eddd456939ce441ac58670cf2dad986e2dceaa3"),
        .binaryTarget(name: "libavdevice", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libavdevice.xcframework.zip", checksum: "b84db19c647cf93e1879810cb1e82505cf66f23891dd22e1a5b49a301735d01b"),
        .binaryTarget(name: "libavfilter", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libavfilter.xcframework.zip", checksum: "3a9ca764b87c8868641cb9a5f5c88558fb727e8f6d9da11c6a76d20a97383da1"),
        .binaryTarget(name: "libavformat", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libavformat.xcframework.zip", checksum: "7ae594999b61c3bb94d6e739461ccc03d54b47d69005898c458ba3af3e4ff84e"),
        .binaryTarget(name: "libavutil", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libavutil.xcframework.zip", checksum: "e003f3e891676385db0dc91360054e7e42ca2ff7acd3d85f1a239e52a315dc0c"),
        .binaryTarget(name: "libswresample", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libswresample.xcframework.zip", checksum: "534d4d968fbb903d89d399d0ccb7f1fbbfb9716c62501a89a66e0ab4379fb64c"),
        .binaryTarget(name: "libswscale", url: "https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/libswscale.xcframework.zip", checksum: "25a7f788a2f7d62b994160b8a85d2c466898289dc740ed3cbc5841042861e82e")
])
