class Grimoire < Formula
  desc "A declarative, language-agnostic execution framework"
  homepage "https://jlkendrick.github.io/grimoire"
  url "https://github.com/jlkendrick/grimoire/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "68cfc79e30ea21787e0feb1cd0848d4aff13a1e06aa51bcfde5b9ea417af8719"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grimoire --version")
  end
end
