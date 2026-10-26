class Socli < Formula
  desc "Thread-first terminal client for social networks"
  homepage "https://socli.sh"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.2/socli-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0447793e80148bac6bb379f4b7a4c9d85850f424f93d1d2decdcafebd962f6cc"
    end

    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.2/socli-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "63c4e3b427f859df61f61525c9f1af0fb62cf10c07e8fa3688d6db6eba25bd35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.2/socli-0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6b4dfe8bcb58053a68519ba2dd7f71eddbd8d25e9a3e86d06ebf5edab68058e6"
    end

    on_intel do
      url "https://github.com/massimodeluisa/socli/releases/download/v0.1.2/socli-0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e218336473a99f89d237035b674c6cbb4da9c6532bb50f41abfa592d43d1719f"
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
