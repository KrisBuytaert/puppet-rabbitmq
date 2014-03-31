

define rabbitmq::enableplugins ($plugin)
{

  Exec {
    path        => '/usr/bin:/usr/sbin:/bin',
    environment => 'HOME=/var/lib/rabbitmq'
  }

  exec {"enable plugin ${plugin}":
    command   => "rabbitmq-plugins enable $plugin",
    unless    => "rabbitmq-plugins list -E | grep ${plugin}",
    notify    => Service['rabbitmq-server'],
    logoutput => 'on_failure',
  }

}
