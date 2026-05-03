# Copyright (c) 2026 Nikita Goncharov
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class AamCli < Formula
  desc "Powerful and intuitive CLI for Abstract Alias Mapping"
  homepage "https://aam.ininids.in.rs/"
  version "0.3.0"
  license "GPL-3.0-or-later"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-macos-arm64"
      sha256 "5defd5f668fd21cc723a0a6833e158f796a4786c7e764aca000ee73eed84fabd"
    else
      url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-macos-amd64"
      sha256 "d2e98ea4942718e65d62f1e142207df936814902a051c632af9bf05d3c156532"
    end
  end

  if OS.linux?
    url "https://github.com/ininids/aam-cli/releases/download/v#{version}/aam-linux-amd64"
    sha256 "0de40c608af1b94ee3cd1f4eab23c309111aee5380e954ddec2e1d95401e39f8"
  end

  def install
    binary_name = OS.mac? ? (Hardware::CPU.arm? ? "aam-macos-arm64" : "aam-macos-amd64") : "aam-linux-amd64"

    bin.install binary_name => "aam"
  end

  test do
    assert_match "aam", shell_output("#{bin}/aam --version")
  end
end