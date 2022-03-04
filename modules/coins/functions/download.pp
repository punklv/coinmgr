function coins::download ( 
		String $url, 
		String $name, 
		String $filename, 
		String $user,
		String $basepath,
		String $packages ) {
	
	$func_name = "coins::download()"

	File {
		ensure => present,
		owner => $user,
		backup => false,
	}
	
	file { [ "${packages}/${name}", "${basepath}/${name}" ]:
		ensure => directory,
		mode => '0755',
	} ->
	
	file { "Downloading package for: ${name}":
		path => "${packages}/${name}/${filename}",
		source => $url,
	}
}
