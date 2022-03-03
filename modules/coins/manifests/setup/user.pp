class coins::setup::user inherits coins {

  notify {'coins::setup::user included': }

  user { "coin_user":
    name => 'coin',
    ensure => present,
    shell      => '/bin/bash',
    home       => '/home/coin',
    managehome => true,
  }
}

