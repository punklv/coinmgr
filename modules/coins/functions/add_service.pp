function coins::add_service ( 
		String $coin_name, 
		String $coin_cli, 
		String $coin_daemon, 
		String $user ) {

	$func_name = 'coins::add_service()'
	
	notify { "Adding SystemD Service for: ${coin_name}": }
	
	file { "/etc/systemd/system/${coin_name}.service":
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => template('coins/systemd_service.erb'),
		ensure => present,
		notify => Service[ "${coin_name}" ]
	}
	
	service { "${coin_name}": 
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
