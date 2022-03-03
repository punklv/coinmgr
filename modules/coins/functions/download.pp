function coins::download ( String $url, String $name, String $filename, String $version ) {

	require coins::setup::dirs
	
	$func_name = "coins::download()"
	$basepath = $coins::setup::dirs::basepath

	File {
		ensure => present,
		owner => 'coins',
		group => 'wheel',
		backup => false,
	}
	
	file { "${basepath}/${name}":
		ensure => directory,
		mode => '0755',
	}
	
	# TODO
	# change the dir structure to something with more sense
	# base/ /tarballs /blocknet /pivx
	
	file { "${basepath}/${name}/${filename}":
		source => $url,
	}
}
