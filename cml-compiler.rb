require "formula"

class CmlCompiler < Formula
  VERSION = "0.10"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}.zip"
  sha256 ""

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    prefix.install Dir["*"]
    bin.install_symlink "bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
