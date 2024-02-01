# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.23.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'ab1e3d844bc41656b487f88de5c243f8b9d9d7512d36bae232edcadad4b0a79b'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '2c7751b1cd7b7828677b409ef05a3c14c91a25732a43f532da9f7d6ee1a212e2'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'ff97676ea17b50dcec9fe4aefc4877d2a0132c75dceb1ff8dc3412d1d68dc5ba'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '9fad1c9450e33f0cc2dab59fa5d647f8393a224c895b3f382fe204cfa2294ae6'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.23.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '16c1b62f8c2c23198dbfa8d3df2d9deb4c17e8286bab5c305c62fbc8d59cabbe'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
