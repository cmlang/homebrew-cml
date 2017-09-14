require "formula"

class CmlCompilerAT201709 < Formula
  VERSION = "2017.09.13-alpha"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "5d38bc781719edf7f89161ab3c3c6fee3db639d8bcffd56f0c45ae920d45794b"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
