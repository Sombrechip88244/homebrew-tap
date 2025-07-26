class ShellSwitcher < Formula
  desc "A simple shell switcher written in a shell script"
  homepage "https://github.com/Sombrechip88244/SS---Shell-Switcher"
  url "https://github.com/Sombrechip88244/SS---Shell-Switcher/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "33d6ebf19c8c4b209dfee5b442868818568fc06578c8c1d42230680f77b1ce2f"
  license "GPL-3.0"

  def install
    bin.install "main.sh" => "shell-switcher"
    
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
