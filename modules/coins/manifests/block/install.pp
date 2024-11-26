class coins::block::install inherits coins::block {
	notify { "coins::block::install included": }
	
	require coins::setup::dirs
	require coins::setup::user
	
	$data = lookup('coins::block', Hash, deep, {})
	
	$user = $coins::setup::user::user
	$basepath = $coins::setup::dirs::basepath
	$packages = $coins::setup::dirs::packages
	$url = $data['url']
	$coin_name = $data['name']
	$filename = $data['filename']
	$version = $data['version']
	$coin_startup = $data['startup']
	$coin_cli = "${basepath}/${coin_name}/${coin_name}-${version}/bin/${coin_name}-cli"
	$coin_daemon = "${basepath}/${coin_name}/${coin_name}-${version}/bin/${coin_name}d"
	
	coins::download($url, $coin_name, $filename, $user, $basepath, $packages)
	coins::unpack($coin_name, $version, $filename, $basepath, $packages)
	
	# make ~/.blocnet
	coins::make_home($user, $coin_name)
	
	# generate systemd conf
	coins::add_service($coin_name, $coin_cli, $coin_daemon, $user)

	# make links
	coins::make_links($coin_cli, $coin_daemon, $coin_name)
	
}
