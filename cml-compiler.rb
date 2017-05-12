require "formula"

class CmlCompiler < Formula
  VERSION = "0.3"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "http://github.com/cmlang/cml-package-#{VERSION}-distribution.zip"
  sha256 "fa3aac5ee25f7fd83db432c63551b1f57fd6c9747ca78db0164f58345f709cb5"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
