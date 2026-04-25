class Grimoire < Formula
  desc "A declarative, language-agnostic execution framework"
  homepage "https://jlkendrick.github.io/grimoire"
  url "https://github.com/jlkendrick/grimoire/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "95d239044e714f824fdd6195b613d83d01f307e253cc6b31dfbadc0e3227cdfa"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grimoire --version")
  end
end
