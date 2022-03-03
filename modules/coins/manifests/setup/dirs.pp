class coins::setup::dirs inherits coins::setup {
#(
#  Any $qwe,
#  ) {

# notify { "${qwe}": }

	notify { 'coins::setup::dirs included': }
	
	require coins::setup::user
	
	$settings = lookup('coins::setup', Hash, deep, {})
	$basepath = $settings['basepath']
	$unpack_dir = $settings['unpack']
	$tarballs_dir = $settings['tarballs']
	$register_dir = $settings['register']

	
	File {
		ensure => present,
		owner => 'coins',
		group => 'wheel',
		backup => false,
	}
	
	file { ['/opt/coins/', '/opt/coins/unpack', '/opt/coins/tarballs', '/opt/coins/register']: 
		ensure => directory,
		mode => '0755',
	}



	# $dirs = lookup('coins::setup::dirs', Hash, deep, {})

}

#  $tarball_path = "${config['basepath']}/install/${config['tarball']}"
#  $install_path = "${config['basepath']}/install"

#  File {
#    ensure => present,
#    owner => 'coin',
#    group => 'coin',
#    require => User['coin', ],
#  }

#  file { "${config['name']}_base_directory":
#    ensure => directory,
#    path => $config['basepath'],
#  }

#  file { "${config['name']}_setup_directory":
#    ensure => directory,
#    path => $install_path,
#    require => File["${config['name']}_base_directory"]
#  } 

#  file { "${config['name']}_tarball":
#    path => $tarball_path,
#    source => "puppet:///modules/coins/${config['tarball']}",
#    require => File["${config['name']}_setup_directory"],
#  }


