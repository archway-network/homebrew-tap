class Archway < Formula
  desc "The Archway Network smart contracts runtime"
  homepage "https://archway.io"
  license "GPL-2.0-only"

  version "7.0.1"

  on_macos do
    url "https://github.com/archway-network/archway/releases/download/v#{version}/archwayd_darwin_all.zip"
    sha256 "15caa730b8ba3bd878c449cc5d0d2882b125569260a89decb3ace9328d6ca316"

    def install
      bin.install "archwayd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/archway-network/archway/releases/download/v#{version}/archwayd_linux_arm64.zip"
      sha256 "5db3f24424d9fd4f7e55b199f04470e8a6b10fe5530f06fe0e6a7a9ed69d8f21"

      def install
        bin.install "archwayd"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/archway-network/archway/releases/download/v#{version}/archwayd_linux_amd64.zip"
      sha256 "c5ef072007380e300c756750e04257f164b03d7ed28adb98189a7d9af92d1cce"

      def install
        bin.install "archwayd"
      end
    end
  end

  test do
    assert_equal "#{version}", shell_output("#{bin}/archwayd version").strip
  end
end
