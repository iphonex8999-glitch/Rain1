#!/bin/bash

# 1. 先清理掉旧的索引文件，防止冲突
echo "🧹 正在清理旧文件..."
rm Packages Packages.bz2

# 2. 扫描 debs 文件夹，生成新的“菜单” (Packages)
echo "📦 正在扫描插件生成新索引..."
dpkg-scanpackages -m ./debs > Packages

# 3. 把“菜单”压缩一下，方便手机下载 (Packages.bz2)
echo "🗜 正在压缩索引..."
bzip2 -k Packages

# 4. 把所有东西上传到 GitHub
echo "🚀 正在上传到云端..."
git add .
git commit -m "Auto update via script"
git push

echo "✅ 全部搞定！你的源已经更新了。"