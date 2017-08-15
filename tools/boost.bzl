DEFAULT_COPTS = ["-Wno-unused-value"]

def boost_library(name, defines=None, deps=None, extra_srcs=None, extra_hdrs=None, linkopts=None):
    if defines == None:
        defines = []

    if deps == None:
        deps = []

    if extra_srcs == None:
        extra_srcs = []

    if extra_hdrs == None:
        extra_hdrs = []

    if linkopts == None:
        linkopts = []

    return native.cc_library(
        name = name,
        visibility = ["//visibility:public"],
        defines = defines,
        hdrs = native.glob([
            x % name
            for x in [
                'libs/%s/src/*.hpp',
                'boost/%s/**/*.ipp',
            ]
        ]) + extra_hdrs,
        srcs = native.glob([
            x % name
            for x in [
                'libs/%s/src/*.cpp',
                'boost/%s/detail/*.hpp',
            ]
        ]) + extra_srcs,
        deps = deps,
        copts = DEFAULT_COPTS,
        linkopts = linkopts,
    )


def boost_deps():
    native.new_http_archive(
        name = "boost",
        url = "https://dl.bintray.com/boostorg/release/1.63.0/source/boost_1_63_0.tar.bz2",
        build_file = "@com_github_nicolov_boost_bazel//:BUILD",
        strip_prefix = "boost_1_63_0/",
        sha256 = "beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0",
    )
