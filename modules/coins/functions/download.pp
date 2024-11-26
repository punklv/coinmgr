function coins::download ( 
		String $url, 
		String $name, 
		String $filename, 
		String $user,
		String $basepath,
		String $packages ) {
	
	$func_name = "coins::download()"

	file { [ "${packages}/${name}", "${basepath}/${name}" ]:
		ensure => directory,
		* => $coins::defaults_dir
	} ->
	
	file { "Downloading package for: ${name}":
		path => "${packages}/${name}/${filename}",
		source => $url,
		* => $coins::defaults_file
	}
}
