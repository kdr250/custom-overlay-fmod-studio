# custom-overlay-fmod-studio
FMOD Studio APIをvcpkgのcustom overlayとして使えるようにするレポジトリ。

## Install
1. 先に[custom-overlay-fmod](https://github.com/kdr250/custom-overlay-fmod)をインストールすること。
2. [FMOD](https://www.fmod.com/download)をダウンロード、解凍。<br>
  ※1で既にダウンロード、解凍済みならばそれを使えば良い。
3. 任意のディレクトリに、vcpkgのcustom overlay用のディレクトリを作成。<br>※1で既に作ってある場合は同じディレクトリで良い<br>
  `mkdir custom-overlay && cd custom-overlay`
4. 本プロジェクトをgit cloneする。<br>
  `git clone https://github.com/kdr250/custom-overlay-fmod-studio.git fmodstudio`
5. 解凍したFMODのファイルを所定の位置にコピーする。<br>
  FMOD Programmers API/api/studio/inc内のファイルを、このプロジェクトのinclude内にコピー。<br>
  FMOD Programmers API/api/studio/lib内のファイルを、このプロジェクトのlib内にコピー。
6. 最終的に以下のようなディレクトリ構成になる。
<pre>
.
└── custom-overlay
    └── fmodstudio
        ├── include
            ├── fmod_studio_common.h
            ├── fmod_studio.cs
            ├── fmod_studio.h
            └── fmod_studio.hpp
        ├── lib
            ├── libfmodstudio.dylib ※Macの場合
            ├── fmodstudio.dll ※Windowsの場合
            └── fmodstudio_vc.lib ※Windowsの場合
        ├── fmodstudio-config.cmake
        ├── LICENSE
        ├── portfile.cmake
        ├── usage
        └── vcpkg.json
</pre>
７. vcpkgでインストールする。(triplet指定などは適宜指定すること)<br>
```
vcpkg install fmodstudio --overlay-ports=Your/Path/To/custom-overlay
```

8. 以下のusageが表示されればインストールできたはず。<br>
<pre>
find_package(FMODStudio REQUIRED)
target_link_libraries(main PRIVATE FMODStudio::FMODStudio)
</pre>

9. あとはFMOD Studio APIを使いたいプロジェクトのCMakeLists.txtでfind_packageすれば良い。

## 参考にしたURL
[チュートリアル: vcpkg を使用してライブラリをパッケージ化する](https://learn.microsoft.com/ja-jp/vcpkg/get_started/get-started-packaging?pivots=shell-bash)<br>
[What's a simple straightforward find_package set of files for CMake](https://stackoverflow.com/questions/73830279/whats-a-simple-straightforward-find-package-set-of-files-for-cmake)
