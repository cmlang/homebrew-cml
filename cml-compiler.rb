require "formula"

class CmlCompiler < Formula
  VERSION = "0.2"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "http://github.com/cmlang/cml-package-#{VERSION}-distribution.zip"
  sha256 "7d509df88566dd20ac8303f84725fa7b58e1b40ca60fb21f42c9debc93166efd  target/cml-package-0.2-distribution.zip"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
