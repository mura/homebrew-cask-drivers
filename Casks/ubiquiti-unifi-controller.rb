cask 'ubiquiti-unifi-controller' do
  version '5.10.24'
  sha256 'bb06ed7c50a9b4a69b690cc19dc5b840f8b319aa1845e1059ddd425a6b18d390'

  # dl.ubnt.com was verified as official when first introduced to the cask
  url "https://dl.ubnt.com/unifi/#{version}/UniFi.pkg"
  appcast 'https://www.ui.com/download/unifi'
  name 'Ubiquiti UniFi Network Controller'
  homepage 'https://unifi-sdn.ui.com/'

  conflicts_with cask: 'ubiquiti-unifi-controller-lts'

  pkg 'UniFi.pkg'

  postflight do
    set_ownership '~/Library/Application Support/UniFi'
  end

  uninstall quit:    [
                       'com.oracle.java.*.jre',
                       'com.ubnt.UniFi-Discover',
                     ],
            signal:  ['TERM', 'com.ubnt.UniFi'],
            pkgutil: 'com.ubnt.UniFi',
            delete:  [
                       '/Applications/UniFi-Discover.app',
                       '/Applications/UniFi.app',
                     ]

  zap trash: [
               '~/Library/Application Support/UniFi',
               '~/Library/Saved Application State/com.ubnt.UniFi-Discover.savedState',
               '~/Library/Saved Application State/com.ubnt.UniFi.savedState',
             ]

  caveats do
    license 'https://www.ui.com/eula/'
  end
end
