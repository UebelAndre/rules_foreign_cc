"""A module for defining WORKSPACE dependencies required for rules_foreign_cc"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=unnamed-macro
def rules_foreign_cc_dependencies():
    """Load all dependencies of rules_foreign_cc"""

    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "cdc853460de2245b3b49a0a9b178d20d7768c94da4d78d0b2c6d7048df2d4f11",
        strip_prefix = "rules_rust-a667ff9bdc3a800e3005e8f19b89283a6a1be5a4",
        # Main branch as of 2021-04-02
        url = "https://github.com/bazelbuild/rules_rust/archive/a667ff9bdc3a800e3005e8f19b89283a6a1be5a4.tar.gz",
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        ],
    )
