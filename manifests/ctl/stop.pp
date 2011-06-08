# Define: rabbitmq::ctl::stop
#
# Stops the Erlang node on which RabbitMQ is running.
#
# Usage:
# rabbitmq::ctl::stop { "stop": }
#
define rabbitmq::ctl::stop() {

	exec { "stop": command => "/usr/sbin/rabbitmqctl stop" }

}
