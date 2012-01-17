#
# Class: rabbitmq
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# Usage:
# include rabbitmq
#
class rabbitmq {

	# Ensure rabbitmq is installed:
	package { "rabbitmq-server": ensure => present }

	# Ensure rabbitmq is running:
	service { "rabbitmq-server":
		enable		=> $operatingsystem ? {
                  "Debian" => undef,
                  "Ubuntu" => undef,
                  default  => true
                },
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> true,
		require		=> Package["rabbitmq-server"],
	}

}
