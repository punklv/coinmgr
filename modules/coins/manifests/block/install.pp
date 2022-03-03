class coins::block::install inherits coins::block {
	
	notify { "coins::block::install included": }
	
	$data = lookup('coins::block', Hash, deep, {})
	
	coins::download($data['url'], $data['name'], $data['filename'], $data['version'])
	
	coins::unpack($data['name'], $data['filename'])

}