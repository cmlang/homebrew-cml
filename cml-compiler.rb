require "formula"

class CmlCompiler < Formula
  VERSION = "0.1"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "http://github.com/cmlang/cml-package-#{VERSION}-distribution.zip"
  sha256 "d892fa4fc0b49e7534ae87f25415047f3c7ceb880137d871d7819b1f2fb2a367  target/cml-package-0.1-distribution.zip"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
