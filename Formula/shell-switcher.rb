class ShellSwitcher < Formula
  desc "A simple shell switcher written in a shell script"
  homepage "https://github.com/Sombrechip88244/SS---Shell-Switcher"
  url "https://github.com/Sombrechip88244/SS---Shell-Switcher/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "97fd61e8cc364ec301f8f59295e5197323ec6fd51e81c1dc1d5661db9e7396be"
  license "GPL-3.0"

  def install
    bin.install "main.sh" => "shell-switcher"
    man1.install "man/shell-switcher.1"
    # Make the script executable
    chmod 0755, bin/"shell-switcher"
  end

  test do
    # Test that the script exists and is executable
    assert_predicate bin/"shell-switcher", :exist?
    assert_predicate bin/"shell-switcher", :executable?
    
    # Basic functionality test - check if it shows current shell
    output = shell_output("#{bin}/shell-switcher <<< 'no'")
    assert_match "Your current shell is", output
  end
end
