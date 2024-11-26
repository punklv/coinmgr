class coins::setup::dirs inherits coins::setup {
#(
#  Any $qwe,
#  ) {

# notify { "${qwe}": }

	notify { 'coins::setup::dirs included': }
	
	require coins::setup::user
	
	$settings = lookup('coins::setup', Hash, deep, {})
	$basepath = $settings['basepath']
	$packages = $settings['packages']
	
	file { [ $basepath, $packages ]: 
		ensure => directory,
		* => $coins::defaults_dir
	}
}

