class Cachee < Formula
  desc "Post-quantum caching service with nanosecond reads and PQ attestation"
  homepage "https://cachee.ai"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.1.3/cachee-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "89eede8f6dcf088fa1180f4f90580ccacca4c3fd9a9ef2734997a5fa477d75a0"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
