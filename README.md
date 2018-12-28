# README

## 已知问题

### Known Issues

Apps that contain asset catalogs built using Xcode 10 or later with a deployment target of iOS 9.0, 9.1 or 9.2 produce content incompatible with the runtimes of those iOS versions when you’re using app thinning as part of exporting an archive for local or enterprise distribution. (46893768)

### Resolved Issues

Resolved an issue that affected app compatibility with iOS 9.0, 9.1, and 9.2 when distributing an app on the App Store. App asset catalogs built using Xcode 10 with a deployment target of iOS 9.0, 9.1 or 9.2 produce content incompatible with the runtimes of those iOS versions when distributed via the App Store. Rebuild and resubmit the app using Xcode 10.1 to resolve the issue. (44535967, 45723580, 45723189)

The 40mm and 44mm wells for complications specify the correct icon sizes. (43069075, 43401397)
[原文地址 Asset Catalog](https://developer.apple.com/documentation/xcode_release_notes/xcode_10_1_release_notes)

## 解决方法

用Xcode 9.x 编译生成的Assets.car替换掉Xcode 10.1 生成的Assets.car

## Assets.car提取

Xcode 9.x Organizer -> Archives -> Show in Finder
