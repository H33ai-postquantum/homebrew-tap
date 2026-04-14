class Cachee < Formula
  desc "Post-quantum caching service with nanosecond reads and PQ attestation"
  homepage "https://cachee.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.1.0/cachee-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "00e769fb42ec92f3cf6734dff3d9b3a264bd6c1abab1094a412ae2efc7558f7a"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
