

define rabbitmq::enableplugins ($plugin)
{
  concat::fragment {$name:
    target  => '/etc/rabbitmq/enabled_plugins',
    content => template('rabbitmq/enabled_plugins.erb'),
    order   => 10,
  }

}
