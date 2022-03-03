function coins::unpack ( String $name, String $filename ) {

	$func_name = 'coins::unpack()'
	
	$basepath = $coins::setup::dirs::basepath
	$tarballs_dir = $coins::setup::dirs::tarballs_dir
	$unpack_dir = $coins::setup::dirs::unpack
	
	Exec {
		path => '/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/puppetlabs/bin',
		user => 'coins',
	}
	
	
	file { "${unpack_dir}/${name}-{version}":
		ensure => directory,
		mode => '0755',
	}
	
	exec { "Unpacking: ${name}":
		cwd => "${unpack_dir}/${name}-{version}",
		require => File[ "${unpack_dir}/${name}-{version}" ],
		command => 'hostname',
	}
}