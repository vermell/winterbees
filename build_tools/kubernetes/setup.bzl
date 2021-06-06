
load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")
load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults")

def setup_k8():
    k8s_go_deps()
    k8s_defaults(
        # This becomes the name of the @repository and the rule
        # you will import in your BUILD files.
        name = "k8s_deploy",
        # This is the name of the cluster as it appears in:
        #   kubectl config view --minify -o=jsonpath='{.contexts[0].context.cluster}'
        cluster = "cluster.local",
        kind = "deployment",
    )
