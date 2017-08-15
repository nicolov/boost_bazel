# Bazel rules for boost

## Usage

```
local_repository(
    name='com_github_nicolov_rules_boost',
    path='rules_boost',
)

load('@com_github_nicolov_rules_boost//:tools/boost.bzl', 'boost_deps')

boost_deps()
```
