workspace(name = "winterbees")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# docker rules
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59d5b42ac315e7eadffa944e86e90c2990110a1c8075f1cd145f487e999d22b3",
    strip_prefix = "rules_docker-0.17.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.17.0/rules_docker-v0.17.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure = "toolchain_configure",
)
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "ubuntu_image_base",
    #digest = DIGESTS["latest"],
    digest = "sha256:86ac87f73641c920fb42cc9612d4fb57b5626b56ea2a19b894d0673fd5b4f2e9",
    registry = "docker.io",
    repository = "library/ubuntu",
)

http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "773aa45f2421a66c8aa651b8cecb8ea51db91799a405bd7b913d77052ac7261a",
    strip_prefix = "rules_k8s-0.5",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/v0.5.tar.gz"],
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("//build_tools/kubernetes:setup.bzl", "setup_k8")

setup_k8()

load("//build_tools/python:drte.bzl", "install_drte_environment")

install_drte_environment()

git_repository(
    name = "dbx_build_tools",
    commit = "e15300460d41fff89da6ef2584441f1989b080cb",
    remote = "https://github.com/dropbox/dbx_build_tools",
    #sha256 = "1ee697949f313a0444e3bbc113a53456d2e760f820723497043a80bca1b2fd30",
    #strip_prefix = "dbx_build_tools-master",
    shallow_since = "1622161970 +0000",
)

load("@dbx_build_tools//build_tools/bazel:external_workspace.bzl", "drte_deps")

drte_deps()

register_toolchains(
    "@dbx_build_tools//thirdparty/cpython:drte-v3-27-toolchain",
    "@dbx_build_tools//thirdparty/cpython:drte-v3-38-toolchain",
)
