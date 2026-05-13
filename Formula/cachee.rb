class Cachee < Formula
  desc "Verifiable computation cache with PQ attestation and audit-grade infrastructure"
  homepage "https://cachee.ai"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/cachee-cli/releases/download/v0.3.0/cachee-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "5924485197d3a445cd659804658b679001614ffe8a03ff4f6faba2300c8e698d"
    end
  end

  def install
    bin.install "cachee"
  end

  test do
    assert_match "cachee #{version}", shell_output("#{bin}/cachee --version")
  end
end
