class Dirvana < Formula
  desc "Intelligent directory navigation and command augmentation tool for Zsh"
  homepage "https://github.com/jlkendrick/dirvana"
  url "https://github.com/jlkendrick/dirvana/archive/refs/tags/v1.1.8.tar.gz"
  sha256 "49e597d7b6915cb0f868c40c2b567835598f98825cd2d1021badac3ff073a7c4"
  license "MIT"

  depends_on "cmake" => :build
  depends_on :macos

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DDIRVANA_VERSION=#{version}",
           *std_cmake_args
    system "cmake", "--build", "build", "--target", "dv-binary"
    bin.install "build/dv-binary"
    zsh_completion.install "docs/scripts/_dv"
    etc.install "docs/scripts/dirvana.zsh"
  end

  def caveats
    <<~EOS
      Run the following to finish setup:

        dv-binary init

      Then reload your shell:

        source ~/.zshrc
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dv-binary --version")
  end
end
