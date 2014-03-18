

define rabbitmq::enableplugins ($plugin)
{

  Exec {
    path => ['/usr/sbin/','/bin','/usr/local/bin'],
  }

  exec {"enable plugin ${plugin}":
    command => "rabbitmq-plugins enable $plugin",
    unless  => "rabbitmq-plugins list -E | grep $plugin",
    notify  => Service['rabbitmq-server'],
  }

}
