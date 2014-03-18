

define rabbitmq::enableplugins ($plugin)
{

  exec {"enable plugin ${plugin}":
    command => "rabbitmq-plugins enable $plugin",
    unless  => "rabbitmq-plugins list -E | grep $plugin",
    notify  => Service['rabbitmq-server'],
  }

}
