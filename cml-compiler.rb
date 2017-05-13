require "formula"

class CmlCompiler < Formula
  VERSION = "0.7"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}-distribution.zip"
  sha256 "38a89752ad4d2cefe4938784ccacdb9ad5cceda2dcdd0363ea1a47c1c7a3c8df"

  def install
    libexec.install Dir["*"]
    libexec.inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
