class Cachee < Formula
  desc "Post-quantum caching service with nanosecond reads and PQ attestation"
  homepage "https://cachee.ai"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.1.1/cachee-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "a3b4c92722fb390f11a11748890ece77924941d69bbddc73a7b91d55d9a4817a"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
