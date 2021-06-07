load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def filename_from_label(label):
    return str(Label(label))

def install_drte_environment():
    http_file(
        name = "drte_runtime_deb",
        #executable = True,
        urls = ["https://github.com/vermell/dbx_build_tools/releases/download/v0.0.1-alpha/drte-v3_1.0.0_amd64.deb"],
        sha256 = "4618f84a82e4ed5a26365fe68db35230f40752067b023b5dfcd3cfb43c046d7a",
    )

    http_archive(
        name = "custom_drte_toolchain",
        urls = ["https://github.com/vermell/dbx_build_tools/releases/download/v0.0.1-alpha/drte-v3-build-sysroot_1.0.0.tar.xz"],
        sha256 = "a84bdc7cb63c5a06465537ef2910908fd7b964b36f6a1ab0c0e4a7ee227b9deb",
        build_file = filename_from_label("//thirdparty/native/drte_toolchain:BUILD.drte"),
    )

   # http_archive(
   #     name = "org_python_cpython_27",
   #     urls = ["https://www.python.org/ftp/python/2.7.17/Python-2.7.17.tar.xz"],
   #     sha256 = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41",
   #     build_file = filename_from_label("//3rdparty/native/cpython:BUILD.python27"),
   #     strip_prefix = "Python-2.7.17",
   # )

    #http_archive(

    #    name = "org_python_cpython_38",
    #    urls = ["https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tar.xz"],
    #    sha256 = "75894117f6db7051c1b34f37410168844bbb357c139a8a10a352e9bf8be594e8",
    #    build_file = filename_from_label("//3rdparty/native/cpython:BUILD.python38"),
    #    strip_prefix = "Python-3.8.1",
    #)

    # Real use cases should pin a commit and set the sha256.

    ## other external sources
    #http_archive(
    #    name = "lz4",
    #    urls = ["https://github.com/lz4/lz4/archive/v1.9.3.tar.gz"],
    #    sha256 = "030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1",
    #    strip_prefix = "lz4-1.9.3",
    #    build_file = filename_from_label("//3rdparty/native/lz4:BUILD.lz4"),
    #)

    http_archive(
        name = "zstd",
        urls = ["https://github.com/facebook/zstd/releases/download/v1.4.9/zstd-1.4.9.tar.gz"],
        sha256 = "29ac74e19ea28659017361976240c4b5c5c24db3b89338731a6feb97c038d293",
        strip_prefix = "zstd-1.4.9",
        build_file = filename_from_label("//3rdparty/native/zstd:BUILD.zstd"),
    )

    #http_archive(
    #    name = "org_bzip_bzip2",
    #    urls = ["https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz"],
    #    sha256 = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269",
    #    strip_prefix = "bzip2-1.0.8",
    #    build_file = filename_from_label("//3rdparty/native/bzip2:BUILD.bzip2"),
    #)

    #  http_archive(
    #      name = "net_zlib",
    #      urls = ["http://zlib.net/zlib-1.2.11.tar.gz"],
    #      sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
    #      strip_prefix = "zlib-1.2.11",
    #      build_file = filename_from_label("@dbx_build_tools//thirdparty/zlib:BUILD.zlib"),
    #  )

    http_archive(
        name = "org_sourceware_libffi",
        urls = ["https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"],
        sha256 = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056",
        build_file = filename_from_label("@dbx_build_tools//thirdparty/libffi:BUILD.libffi"),
        strip_prefix = "libffi-3.3",
    )

    #http_archive(
    #    name = "org_sqlite",
    #    urls = ["https://sqlite.org/2021/sqlite-amalgamation-3350500.zip"],
    #    sha256 = "b49409ef123e193e719e2536f9b795482a69e61a9cc728933739b9024f035061",
    #    strip_prefix = "sqlite-amalgamation-3350500",
    #    build_file = filename_from_label("//thirdparty/sqlite:BUILD.sqlite"),
    #)

    http_archive(
        name = "snappy",
        urls = ["https://github.com/google/snappy/archive/refs/tags/1.1.8.tar.gz"],
        #sha256 = "b49409ef123e193e719e2536f9b795482a69e61a9cc728933739b9024f035061",
        strip_prefix = "snappy-1.1.8",
        build_file = filename_from_label("//thirdparty/sqlite:BUILD.sqlite"),
    )
