# Define: rabbitmq::ctl::wait
#
# Wait for the RabbitMQ application to start. This command will wait for the
# RabbitMQ application to start at the node. As long as the Erlang node is up
# but the RabbitMQ application is down it will wait indefinitely. If the node
# itself goes down, or takes more than five seconds to come up, it will fail.
#
# Usage:
# rabbitmq::ctl::wait { "wait": }
#
define rabbitmq::ctl::wait() {

	exec { "wait": command => "/usr/sbin/rabbitmqctl wait" }

}
