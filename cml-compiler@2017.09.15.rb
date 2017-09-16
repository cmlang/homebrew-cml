require "formula"

class CmlCompilerAT20170915 < Formula
  VERSION = "2017.09.15-alpha"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "a0070cbe218f41b9f607b75233c803c663f25fefa3287d0843b33b823920abf9"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
