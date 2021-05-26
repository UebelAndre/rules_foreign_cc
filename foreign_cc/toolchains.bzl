"""A module loading all toolchains required for ForeignCc build rules"""

load("@rules_rust//rust:repositories.bzl", "rust_repositories")
load("//foreign_cc/private/framework:toolchain.bzl", "register_framework_toolchains")
load("//toolchains:toolchains.bzl", "built_toolchains", "prebuilt_toolchains", "preinstalled_toolchains")

# buildifier: disable=unnamed-macro
def rules_foreign_cc_toolchains(
        native_tools_toolchains = [],
        register_default_tools = True,
        cmake_version = "3.20.2",
        make_version = "4.3",
        ninja_version = "1.10.2",
        register_preinstalled_tools = True,
        register_built_tools = True):
    """Call this function from the WORKSPACE file to initialize rules_foreign_cc \
    dependencies and let neccesary code generation happen \
    (Code generation is needed to support different variants of the C++ Starlark API.).

    Args:
        native_tools_toolchains: pass the toolchains for toolchain types
            '@rules_foreign_cc//toolchains:cmake_toolchain' and
            '@rules_foreign_cc//toolchains:ninja_toolchain' with the needed platform constraints.
            If you do not pass anything, registered default toolchains will be selected (see below).

        register_default_tools: If True, the cmake and ninja toolchains, calling corresponding
            preinstalled binaries by name (cmake, ninja) will be registered after
            'native_tools_toolchains' without any platform constraints. The default is True.

        cmake_version: The target version of the cmake toolchain if `register_default_tools`
            or `register_built_tools` is set to `True`.

        make_version: The target version of the default make toolchain if `register_built_tools`
            is set to `True`.

        ninja_version: The target version of the ninja toolchain if `register_default_tools`
            or `register_built_tools` is set to `True`.

        register_preinstalled_tools: If true, toolchains will be registered for the native built tools
            installed on the exec host

        register_built_tools: If true, toolchains that build the tools from source are registered
    """
    rust_repositories()

    register_framework_toolchains()

    native.register_toolchains(*native_tools_toolchains)

    if register_default_tools:
        prebuilt_toolchains(cmake_version, ninja_version)

    if register_built_tools:
        built_toolchains(
            cmake_version = cmake_version,
            make_version = make_version,
            ninja_version = ninja_version,
        )

    if register_preinstalled_tools:
        preinstalled_toolchains()
