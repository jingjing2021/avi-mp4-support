# 开源软件说明

AVI 转 MP4 使用 FFmpegKit / FFmpeg 及相关开源组件。第三方代码的版权属于各自作者，具体许可条款适用于对应组件；应用其他部分不因此成为开源软件。

## 替换版本 1.0.1（10）

此版本使用从已记录源码自行构建的 FFmpegKit / FFmpeg（LGPL v3）。

- [完整第三方许可文本](licenses/BUILD-10-NOTICES.txt)。
- [对应库源码、补丁及构建材料](https://github.com/jingjing2021/avi-mp4-support/releases/tag/0.1.0)。
- [重新构建、应用目标文件包及安装说明](REBUILD.md)。
- [目标文件使用授权](APPLICATION-PERMISSION.md)：允许用修改后的兼容库重新链接应用，并调试这些修改；应用 Swift 源码仍为私有。

已验证目标文件可以重新链接；尚未完成独立用户签名及替换库后的真机安装验证。本节不代表旧版源码缺口已解决。

## 已发布版本 1.0（9）

- 分发依赖：FFmpegKit SPM v5.1.2（ffmpeg-kit-https）。
- SPM 包版本提交：`b3a2c365e89c5ec8fdc0debd7b7030152b572620`。
- [完整第三方许可文本](licenses/BUILD-9-NOTICES.txt)，包含归档中随附的许可及 GNU GPL v3。
- [该版本的上游包装与构建脚本](https://github.com/tylerjonesio/ffmpeg-kit-spm/tree/v5.1.2)。这只是包装仓库，不能视为全部底层库的完整对应源码。
- [FFmpegKit 上游](https://github.com/arthenica/ffmpeg-kit)、[FFmpeg 上游](https://ffmpeg.org)。

我们正在整理这份历史预编译库的精确源码来源及构建材料。本页不把尚未验证的源码版本称为旧二进制的对应源码，也不声明仅凭本页已完成所有许可证义务。

开源组件适用的许可所允许的修改和调试权利不受应用其他说明限制。有关开源材料的问题请联系 jy17yyy@gmail.com。
