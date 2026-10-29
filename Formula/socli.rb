class Socli < Formula
  desc "Thread-first terminal client for social networks"
  homepage "https://socli.sh"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.4/socli-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "82ec0ee42c372b3336448598641837843480fe66302b9b5122bae55099b35283"
    end

    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.4/socli-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "bed8f1884c2292e7c0fd45b53b088ec54d409a74328a130803b0f976b9ded7c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.4/socli-0.1.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fbceb3d962240b2f5abb4197ed0c9730c0d6ec8b108e835f2499e81624ab427"
    end

    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.4/socli-0.1.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9160ebd6ebfa9892cd0db4aaab6f8a95dafe15476ec82b34bec765652cd64059"
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
