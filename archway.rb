class Archway < Formula
  desc "Incentivized CosmWasm smart contracts blockchain runtime"
  homepage "https://archway.io"
  url "https://github.com/archway-network/archway/releases/download/v8.0.0/archwayd_darwin_all.zip"
  sha256 "a13526c11bf5d0464a08812721d484c667021dd30a8605592473b9724a0a6129"
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

    generate_completions_from_executable(bin/"archwayd", "completion", base_name: "archwayd", shell_parameter_format: :flag, shells: [:zsh])
  end

  test do
    assert_match version.to_s.sub("HEAD", ""), shell_output("#{bin}/archwayd version").strip
  end
end
