#
# Copyright 2017
#
# All Rights Reserved.
#

name "dradis-ce"
maintainer "Maintainer"
homepage "https://dradisframework.com"

# Defaults to C:/dradis-ce on Windows
# and /opt/dradis-ce on all other platforms
install_dir "#{default_root}/#{name}"

build_version "3.0"
#build_version Omnibus::BuildVersion.semver
build_iteration 1

override :ruby, version: "2.2.5"

# Creates required build directories
dependency "preparation"

# dradis-ce dependencies/components
dependency "dradis-ce-common"

# Version manifest file
dependency "version-manifest"

#exclude "**/.git"
exclude "**/bundler/git"
