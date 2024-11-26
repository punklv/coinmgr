class coins::block::configure inherits coins::block {

	notify { "coins::block::configure included": }

	# servicenode.configure
	# xrouter
	# xbridge

	require coins::setup::dirs
	require coins::setup::user
	require coins::block::install

	$data = lookup('coins::block', Hash, deep, {})
	
	$user = $coins::setup::user::user
	$coin_name = $data['name']
	$configs = $data['configs']
	$coin_home = "/home/${user}/.${coin_name}"
	
	$configs.each | String $config | {
	
		file { "Configuring ${config}":
			source => "puppet:///modules/coins/${config}",
			path => "${coin_home}/${config}",
			notify => Service[ $coin_name ],
			* => $coins::defaults_file
		}
	}
}
