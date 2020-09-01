class Uuu < Formula
  desc "Freescale/NXP I.MX Chip image deploy tools"
  homepage "https://github.com/NXPmicro/mfgtools/"
  url "https://github.com/NXPmicro/mfgtools/releases/download/uuu_1.3.191/uuu_source-1.3.191.tar.gz"
  sha256 "334bda873fd9d9a0e0a4a88fbf0d1ad9a6c5e5b67fbd23cfc34c8b97ef87e6f5"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "libusb"
  depends_on "libzip"
  depends_on "openssl"
  uses_from_macos "bzip2"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    # unfortunately, uuu doesn't do much without hardware
    assert_match "uuu (Universal Update Utility) for nxp imx chips", shell_output("#{bin}/uuu -h")
  end
end
