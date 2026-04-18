class Cachee < Formula
  desc "Post-quantum caching service with nanosecond reads and PQ attestation"
  homepage "https://cachee.ai"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.1.2/cachee-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "e400e10ba84a51c607bdb381492b29b958f74b2c4abb68c1262b6498e4e3ed20"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
