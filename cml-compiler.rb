require "formula"

class CmlCompiler < Formula
  VERSION = "0.5"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}-distribution.zip"
  sha256 "c7d5209a6a4ff409ac5b4db0a551cd700bafab8b36b81d1d15842e3a1b5b010f"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
