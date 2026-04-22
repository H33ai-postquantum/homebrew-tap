class Cachee < Formula
  desc "Post-quantum caching service with nanosecond reads and PQ attestation"
  homepage "https://cachee.ai"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.2.0/cachee-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "77fa30dfe164211cfa089b6fbbd490d5145e501ca4a86ae25d33dea30cf444cc"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
