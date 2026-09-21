# 新版 1.0.1（10）开源材料验证

核验日期：2026-09-21。范围仅为当前新版的 FFmpegKit / FFmpeg 开源材料与替换机制；这是技术验证记录，不是完整法律合规认证。

## 已通过

- **许可与编译配置**：FFmpegKit / FFmpeg 使用 LGPL v3；配置未启用 GPL/nonfree、libx264、libx265、libfdk_aac、GnuTLS。FFmpeg 对 zlib/bzip2 和 Apple 音视频框架使用系统动态库。
- **发布文件与实际上传一致**：公开的八个设备端库 ZIP 校验值匹配固定的 Swift Package 校验值。逐一比较上传归档与公开库的全部 Mach-O 节区，内容一致；签名元数据不参与比较。原始文件与签名文件分别记录 SHA-256。
- **随应用提供许可**：上传归档中的完整 LGPL v3、GPL v3 和第三方声明，与源码资源一致。应用有可见许可入口、版权声明、对应源码与安装说明链接。
- **公开源码可重建**：从公开 release 下载源码和 GNU config，核对 SHA-256，在独立目录解压。补建空的 `.git/refs` 目录后，两个 Git 提交均正确识别，设备与模拟器两个架构均构建成功。公开 REBUILD.md 已补充准确命令；原源码及二进制校验值保持不变。
- **设备端 Release 目标文件可重新链接**：从公开下载的应用目标文件包出发，使用修改后、带运行标记的兼容库重新链接成功；未用私有 Swift 源码重新生成这些设备端目标文件。
- **修改后的库实际运行**：用同版本的模拟器目标文件重新链接独立测试副本，移除开发目录动态库搜索路径并重新签名。在 iOS 18.6 模拟器运行时捕获 8 次修改库标记，两个有效同名 AVI 分别生成非空 MP4，中间损坏输入正确失败且不影响后续转换。
- **用户权限**：公开应用目标文件包附有允许替换兼容库、重新链接、安装运行和为调试这些修改进行逆向工程的授权；第三方许可权利不受该授权限制。应用 Swift 源码继续私有。

## 仍未验证

- 使用接收者自己的签名身份，在物理 iPhone/iPad 安装并运行替换库后的应用。用户目前无法操作已配对设备，因此未执行该项。
- 模拟器验证不等于设备端重新签名安装验证，也不单独证明 LGPL 第 4(e) 条在实际分发场景下的全部义务已满足。测试中未改变 App Store 正式版或上传新的测试构建。

## 可复核证据

- [公开源码与目标文件包](https://github.com/jingjing2021/avi-mp4-support/releases/tag/0.1.0)
- [重建与安装说明](REBUILD.md)
- [库文件核对记录](validation/build10-library-verification.json)
- [替换库运行测试记录](validation/build10-replacement-test.json)
- [测试标记补丁](validation/build10-replacement-marker.patch)
- [应用目标文件授权](APPLICATION-PERMISSION.md)
- [FFmpeg 官方说明](https://ffmpeg.org/legal.html)
- 本次使用的 LGPL v3 第 4 条全文随应用及公开目标文件包提供。
