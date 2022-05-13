# Common packages and APT Settings
#
class beryjuorg_common::packages {

  $packages = [
    'open-vm-tools',
    'vim',
    'htop',
    'sudo',
    'nmap',
    'xkb-data', # For /usr/share/X11/xkb/symbols/us, to fix console-setup service
    'acl',
  ]
  $remove_packages = [
    'snapd',
    'unattended-upgrades',  # Prevent APT errors in ansible"
    'fwupd'
  ]

  apt::source { "archive.ubuntu.com-${facts['os']['distro']['codename']}":
    location => 'mirror://mirrors.ubuntu.com/mirrors.txt',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
  }

  apt::source { "archive.ubuntu.com-${facts['os']['distro']['codename']}-security":
    location => 'mirror://mirrors.ubuntu.com/mirrors.txt',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${facts['os']['distro']['codename']}-security"
  }

  apt::source { "archive.ubuntu.com-${facts['os']['distro']['codename']}-updates":
    location => 'mirror://mirrors.ubuntu.com/mirrors.txt',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${facts['os']['distro']['codename']}-updates"
  }

  apt::source { "archive.ubuntu.com-${facts['os']['distro']['codename']}-backports":
    location => 'mirror://mirrors.ubuntu.com/mirrors.txt',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${facts['os']['distro']['codename']}-backports"
  }

  package { $packages:
    ensure => 'present'
  }
  package { $remove_packages:
    ensure => 'purged'
  }

}
