class setup {

# TODO
# add lsof

  #
  # Packages
  # 
	$packages = lookup('packages', Hash, deep)
	$packages.each | String $pkgtype, Array $pkglist | {
		$pkglist.each | String $pkg | {
			package { "${pkg}":
				ensure => $pkgtype,
				provider => 'yum',
			}
		}
	}
  #
  # Files
  #
  $files_simple = lookup('files::simple', Hash, deep)
  $files_defaults = {
    'ensure' => present,
    'mode' => '0644',
    'owner' => 'root',      
  }
  $files_merged = $files_defaults + $files_simple
  create_resources('file', $files_simple, $files_defaults)

  #
  # Services
  #
  $services = lookup('services', Hash, deep)
  $services_defaults = {
    'ensure' => running,
    'enable' => true,
  }
  create_resources('service', $services, $services_defaults)

  #
  # Users
  #
  $users = lookup('users', Hash, deep)
  create_resources('user', $users)

  #
  # One-time CMDs
  #

  $path = '/usr/bin:/usr/sbin:'

  exec {'FW add puppet service': 
    path => $path,
    command => "firewall-cmd --new-service-from-file=/etc/firewalld/services/puppetmaster.xml --permanent",
    notify => Service['firewalld'],
    unless => 'firewall-cmd --info-service puppetmaster',
  } ->

  exec {'FW add puppet service to public': 
    path => $path,
    command => "firewall-cmd --zone public --add-service puppetmaster --permanent",
    unless => 'firewall-cmd --zone public --list-services | grep puppetmaster',
    notify => Service['firewalld'],
  } ->

  exec {'FW allow snodes to puppet':
    path => $path,
    command => "firewall-cmd --zone public --add-rich-rule='rule family=ipv4 source not ipset=puppetmaster.ipset service name=puppetmaster drop' --permanent",
    unless => 'firewall-cmd --list-all --zone public | grep puppetmaster.ipset',
    notify => Service['firewalld'],
  }
}


