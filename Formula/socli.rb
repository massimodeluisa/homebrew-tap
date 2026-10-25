class Socli < Formula
  desc "Thread-first terminal client for social networks"
  homepage "https://socli.sh"
  url "https://github.com/massimodeluisa/socli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "69e2aea38219cb885018edb181c8b68bd18eb59ea8c2c1b1805238f0e2229f28"
  license "MIT"

  depends_on "rust" => :build

  on_macos do
    depends_on xcode: ["13.0", :build]
  end

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "socli"
  end

  test do
    posts = JSON.parse(shell_output("#{bin}/socli feed --demo --json"))
    assert posts.any? { |post| post.fetch("network") == "devnull" }
  end
end
