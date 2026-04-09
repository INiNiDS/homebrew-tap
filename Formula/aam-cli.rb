# Copyright (c) 2026 Nikita Goncharov
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class AamCli < Formula
  desc "Powerful and intuitive CLI for Abstract Alias Mapping"
  homepage "https://aam.ininids.in.rs/"
  version "0.1.1"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-cli-macos-arm64"
      sha256 "05eac0dfa204240f8f6ab62f43d953644c9d623aa1f1d3899b806efae298d14a"
    else
      url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-cli-macos-amd64"
      sha256 "9e38322163236a0af14d0b023d2b5ae1fefe00521d2e582a1c5c38b8416af74f"
    end
  end

  if OS.linux?
    url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-cli-linux-amd64"
    sha256 "f0c6b87c1b53cb3aefd03ae18c25484ca981d500868e9440ed2cf5984d0f4bc3"
  end

  def install
    binary_name = OS.mac? ? (Hardware::CPU.arm? ? "aam-macos-arm64" : "aam-macos-amd64") : "aam-linux-amd64"

    bin.install binary_name => "aam"
  end

  test do
    assert_match "aam", shell_output("#{bin}/aam --version")
  end
end