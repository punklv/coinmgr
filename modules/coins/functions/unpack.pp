function coins::unpack ( 
		String $name, 
		String $version, 
		String $filename,
		String $basepath,
		String $packages ) {

	$func_name = 'coins::unpack()'
	
	Exec {
		path => '/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/puppetlabs/bin',
		user => $user,
	}
	
	exec { "Unpacking: ${filename}":
		command => "tar -xf ${packages}/${name}/${filename} -C ${basepath}/${name}",
		creates => "${basepath}/${name}/${name}-${version}",
	}
}
