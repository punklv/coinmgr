function coins::make_home ( 
		String $user, 
		String $coin_name ) {

	$func_name = 'coins::make_home()'
	
	notify { "Adding home directories for: ${coin_name}": }
	
	file { "/home/${user}/.${coin_name}":
		owner => $user,
		group => $user,
		mode => '0755',
		ensure => directory,
		purge => false,
	}
}
