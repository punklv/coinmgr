class coins {
    
  require coins::setup::dirs
  require coins::setup::user

	$defaults_file = {
		owner => $coins::setup::user::user,
		group => $coins::setup::user::user,
		backup => false,
		mode => '0640',
	}

	$defaults_dir = {
		owner => $coins::setup::user::user,
		group => $coins::setup::user::user,
		backup => false,
		mode => '0755',
	}

}

