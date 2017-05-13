require "formula"

class CmlCompiler < Formula
  VERSION = "0.6"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}-distribution.zip"
  sha256 "23790948112692113664cda563539973cb61839fde645ccd5c96d44f804e3418"

  def install
    libexec.install Dir["*"]
    inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
