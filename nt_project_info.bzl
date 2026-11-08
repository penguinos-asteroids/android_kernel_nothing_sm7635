# SPDX-License-Identifier: GPL-2.0-only

"""Expose the Nothing project name to the kernel build."""

def _impl(repository_ctx):
    project = repository_ctx.os.environ.get("NT_PROJECT", "Asteroids")
    repository_ctx.file("BUILD", "exports_files([\"dict.bzl\"])\n", executable = False)
    repository_ctx.file("dict.bzl", "TARGET_PRODUCT = \"{}\"\n".format(project), executable = False)

nt_project_info_repo = repository_rule(
    implementation = _impl,
    environ = ["NT_PROJECT"],
    local = True,
)
