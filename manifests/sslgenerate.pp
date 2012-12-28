# Class: rabbitmq::sslgenreate
#
#Enables Stomp
#
# Usage:
# include rabbitmq::sslgenerate
#

# This requires Joe Miller ssl script
# As a submodule of the rabbitmq ssl module  There most probably is a better approach to this
class rabbitmq::sslgenerate{
  file { '/usr/local/ssl-gen':
    ensure  => 'directory',
    group   => '0',
    mode    => '0755',
    owner   => '0',
    recurse => true,
    source  => 'puppet:///modules/rabbitmq/ssl/'
  }

  exec {'/usr/local/ssl-gen/ssl_certs.sh generate':
    cwd           => '/usr/local/ssl-gen',
    require       => File['/usr/local/ssl-gen'],
    unless        => 'test -f /usr/local/ssl-gen/server_key.pem',
    # creates     => '/usr/local/ssl-gen/server_key.pem',
    # refreshonly => true,
  }



  file { '/etc/rabbitmq/ssl/cacert.pem':
    group   => '0',
    mode    => '0755',
    owner   => '0',
    source  => '/usr/local/ssl-gen/testca/cacert.pem',
    require => Exec['/usr/local/ssl-gen/ssl_certs.sh generate'],
  }
  file { '/etc/rabbitmq/ssl/server_cert.pem':
    group   => '0',
    mode    => '0755',
    owner   => '0',
    source  => '/usr/local/ssl-gen/server_cert.pem',
    require => Exec['/usr/local/ssl-gen/ssl_certs.sh generate'],
  }
  file { '/etc/rabbitmq/ssl/server_key.pem':
    group   => '0',
    mode    => '0755',
    owner   => '0',
    source  => '/usr/local/ssl-gen/server_key.pem',
    require => Exec['/usr/local/ssl-gen/ssl_certs.sh generate'],
  }

}
