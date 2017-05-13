require "formula"

class CmlCompiler < Formula
  VERSION = "1.0"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "4bb1ee63be0770fa7b18b282679115c320925d1f27ce8955caa1bb539a4ced1b"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
