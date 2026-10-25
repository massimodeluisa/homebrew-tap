class Socli < Formula
  desc "Thread-first terminal client for social networks"
  homepage "https://socli.sh"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.1/socli-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "71452bc90df05656f2bee4a7ae5ad253b83ba71a76b81089cdc275aad8dffd35"
    end
  end

  on_macos do
    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.1/socli-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a14a9428b0e8fb3f3d06852946d490af5a0ea0bb7ccd4eaadb31e37757730894"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.1/socli-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "13599bc34ca5979d3b5327fec66e1dc89b56ccafc9f42827ad7081f185674b51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.1/socli-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "68d6e4736f85da682c7c1221085c0990d1259c78d6c70916c97ff6593c84668c"
    end
  end

  def install
    bin.install "socli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/socli --version")
    posts = JSON.parse(shell_output("#{bin}/socli feed --demo --json"))
    assert posts.any? { |post| post.fetch("network") == "devnull" }
  end
end
