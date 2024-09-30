class Archway < Formula
  desc "Incentivized CosmWasm smart contracts blockchain runtime"
  homepage "https://archway.io"
  url "https://github.com/archway-network/archway/releases/download/v7.0.1/archwayd_darwin_all.zip"
  sha256 "15caa730b8ba3bd878c449cc5d0d2882b125569260a89decb3ace9328d6ca316"
  license "GPL-2.0-only"

  head do
    url "https://github.com/archway-network/archway.git", branch: "main"

    depends_on "cmake" => :build
    depends_on "go" => :build
  end

  def install
    if build.head?
      system "make", "build"
      bin.install "build/archwayd"
    else
      bin.install "archwayd"
    end

    generate_completions_from_executable(bin/"archwayd", "completion", shell_parameter_format: :flag, shells: [:zsh])
  end

  test do
    assert_match version.to_s.sub("HEAD", ""), shell_output("#{bin}/archwayd version").strip
  end
end
