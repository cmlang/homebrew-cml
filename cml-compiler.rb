require "formula"

class CmlCompiler < Formula
  VERSION = "0.8"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-package-#{VERSION}-distribution.zip"
  sha256 "5f18121ab64c7a5ac4d9dc00d64738859d91eb32ceed1f06eb0ea6ae909d4d53"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
