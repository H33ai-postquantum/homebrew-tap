class H33 < Formula
  desc "H33 terminal companion — post-quantum security in 2 minutes"
  homepage "https://h33.ai"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/H33ai-postquantum/h33-cli-rs/releases/download/v0.2.0/h33-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "53434b80e840acad28b4ef49437123577e8491b33961e98922fb9d4266440a8e"
    end
  end

  def install
    bin.install "h33"
  end

  def caveats
    <<~EOS
      Get started:
        h33 init        # Get a free sandbox key (1,000 units)
        h33 scan .       # Scan your project
        h33 doctor       # Verify your setup

      Docs: https://h33.ai/docs/cli
    EOS
  end

  test do
    assert_match "h33 #{version}", shell_output("#{bin}/h33 --version")
  end
end
