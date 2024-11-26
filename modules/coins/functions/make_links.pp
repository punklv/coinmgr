function coins::make_links ( 
		String $cli, 
		String $daemon,
		String $coin_name ) {
	
	$func_name = 'coins::make_links()'
	
	notify { "Making links for: ${coin_name}": }
	
	
	file { "/usr/bin/${coin_name}-cli":
		ensure => link,
		target => $cli
	}

	file { "/usr/bin/${coin_name}d":
		ensure => link,
		target => $daemon
	}

	file { "/usr/bin/${coin_name}":
		ensure => link,
		target => $cli,
		force => false
	}
}
