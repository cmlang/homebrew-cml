require "formula"

class CmlCompiler < Formula
  VERSION = "0.12"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "4ec144a67dabaff4a7734db13afc836b63b3f323bdb89b2854787b4d0baf3007"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    prefix.install Dir["*"]
    bin.install_symlink prefix/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
