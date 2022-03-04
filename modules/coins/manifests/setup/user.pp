class coins::setup::user inherits coins {

  notify {'coins::setup::user included': }
	
	$settings = lookup('coins::setup', Hash, deep, {})

	$user = $settings['user']

  user { "coin_user":
    name => $user,
    ensure => present,
    shell      => '/bin/bash',
    home       => "/home/${user}",
    managehome => true,
  }
}
