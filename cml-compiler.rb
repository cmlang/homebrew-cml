require "formula"

class CmlCompiler < Formula
  VERSION = "0.9"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}-distribution.zip"
  sha256 "052fa45071bfb6e53ff8949be275a3e0bcb6255bc5b5d1a8a2c6e7ac545a7880"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
