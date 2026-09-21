# Library sources and rebuild instructions — package 0.1.0

These library sources correspond to AVI 转 MP4 1.0.1 builds 10 and 11, not the historical precompiled libraries in 1.0 (9).

## Sources

Download `library-sources.tar.gz`, `gnu-config.tar.gz` and `source-manifest.json` from [release 0.1.0](https://github.com/jingjing2021/avi-mp4-support/releases/tag/0.1.0). The release also contains all eight XCFrameworks consumed by Package.swift. SHA-256 hashes are recorded in the manifest and package definition. Source patches are included under `patches/` in the archive. LGPL v3 and GPL v3 texts are in the source tree; individual source file copyright notices are preserved.

## Build

Use a Mac with Xcode and command-line tools. The reference build uses Xcode 27.0, the iOS 27.0 SDK, and an iOS 17.0 minimum deployment target. Install `pkgconf`, `autoconf`, `automake`, and `libtool` with Homebrew. These are build tools, not code bundled into the app.

Extract the source archive into a new empty working directory. It contains `ffmpeg-kit/`, `ffmpeg/`, `tools/` and `patches/`. Place `ffmpeg/` under `ffmpeg-kit/src/ffmpeg/`. The archives preserve public upstream Git revision data because upstream scripts use it. Place the extracted GNU config files under `ffmpeg-kit/.tmp/source/config/` and copy `tools/gas-preprocessor.pl` to `ffmpeg-kit/.tmp/gas-preprocessor.pl`.

For these exact archives, the following commands reconstruct the required directory layout, including empty Git `refs` directories that the source archive does not store. Run from the new empty working directory after placing the two downloaded archives there:

```sh
tar -xzf library-sources.tar.gz
mkdir -p ffmpeg-kit/src ffmpeg-kit/.tmp/source/config
mv ffmpeg ffmpeg-kit/src/ffmpeg
mkdir -p ffmpeg-kit/.git/refs ffmpeg-kit/src/ffmpeg/.git/refs
tar -xzf gnu-config.tar.gz -C ffmpeg-kit/.tmp/source/config
cp tools/gas-preprocessor.pl ffmpeg-kit/.tmp/gas-preprocessor.pl
chmod +x ffmpeg-kit/.tmp/gas-preprocessor.pl
git -C ffmpeg-kit rev-parse HEAD
# Expected: 64585b76979df0f0283b0cb43db3e64c89b76be6
git -C ffmpeg-kit/src/ffmpeg rev-parse HEAD
# Expected: eacfcbae690f914a4b1b4ad06999f138540cc3d8
```

From `ffmpeg-kit/`, run:

```sh
export PATH="/opt/homebrew/bin:$PATH"
./ios.sh -x --target=17.0 \
  --disable-armv7 --disable-armv7s --disable-arm64e --disable-i386 \
  --disable-x86-64 --disable-arm64-mac-catalyst --disable-x86-64-mac-catalyst \
  --enable-ios-audiotoolbox --enable-ios-videotoolbox \
  --enable-ios-zlib --enable-ios-bzip2
```

Outputs are under `prebuilt/bundle-apple-xcframework-ios/`. Make your changes to the library source before building. Upstream scripts reset and regenerate their own configure/logging workarounds; inspect the included patch records when modifying those particular files. No GPL/nonfree, GMP, GnuTLS or Nettle extras are enabled in this replacement package. Build dates and signatures may differ; exact source provenance does not imply bit-for-bit reproducibility across toolchains.

## Modified library installation

The application dynamically loads the eight frameworks using their existing install names. A modified library must retain the compatible API/ABI and framework names. Replace the corresponding framework in an unencrypted development application bundle and re-sign the frameworks and application with your own Apple development identity and provisioning profile. Install using Xcode or `xcrun devicectl device install app` on your own registered device; Simulator builds use Simulator frameworks and `xcrun simctl install` instead.

Download the [application object-code kit for 1.0.1 (10)](https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/application-object-kit-1.0.1-10.zip), verify its [SHA-256](APPLICATION-KIT-SHA256.txt), and follow its README. It includes release application objects, an unencrypted device app bundle, `relink.sh`, `install.sh`, complete notices and an [application object-code permission](APPLICATION-PERMISSION.md) allowing library replacement, relinking and debugging those modifications. The application Swift source remains private.

The supplied device application objects have been successfully relinked with modified, source-built libraries. A separate iOS 18.6 Simulator application relinked from same-version Simulator objects executed the modified library marker and passed batch conversion; see [validation evidence](VALIDATION.md). Independent-recipient signing and physical-device installation/execution using modified libraries have not yet been verified. The kit does not contain signing credentials or an encrypted App Store download. This document alone does not claim that all LGPL replacement/installation requirements have been satisfied. Questions: jy17yyy@gmail.com.

## Application objects by build

Use the application kit matching your installed build; the corresponding FFmpeg library sources are shared by both builds.

- [1.0.1 (11) — automatic quality](https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/application-object-kit-1.0.1-11.zip)
- [1.0.1 (10)](https://github.com/jingjing2021/avi-mp4-support/releases/download/0.1.0/application-object-kit-1.0.1-10.zip)

Build 11 adds an automatic resolution/frame-rate based bitrate policy and removes the three-way quality selector. It uses the same library package and notices. Its own release object files were successfully relinked, and its standard application passed the iOS 18.6 Simulator batch conversion test. This does not add physical-device modified-library installation validation.
