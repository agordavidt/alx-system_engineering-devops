# Installs a Nginx server with custom HTTP header

exec {'update':
	provider => shell,
	command => 'sudo apt-get -y update',
	before => Exec['install Nginx'],
}

exec {'install Nginx':
	provider => shell,
	command => 'sudo apt-get -y install nginx',
	before => Exec['add_header'],
}
exec { 'add_header':
	provider => shell,
	environment => ["HOST=${hostname}"],
	command		=> 'sudo sed -i "s/include \/etc/ngin
	before = > Exec['restart Nginx']
}
exec { 'restart Ngnx':
	provider => shell,
	command => 'sudo service nginx restart',
}
