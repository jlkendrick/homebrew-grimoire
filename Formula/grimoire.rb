class Grimoire < Formula
  desc "A declarative, language-agnostic execution framework"
  homepage "https://jlkendrick.github.io/grimoire"
  url "https://github.com/jlkendrick/grimoire/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d72793aa832e34261cbd3fc135bd077ac5ff573d693b7527140cdc688bbb99c8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grimoire --version")
  end
end
