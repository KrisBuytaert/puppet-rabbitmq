# Define: rabbitmq::ctl::force_reset
#
# Forcefully return a RabbitMQ node to its virgin state. The force_reset
# command differs from reset in that it resets the node unconditionally,
# regardless of the current management database state and cluster
# configuration. It should only be used as a last resort if the database or
# cluster configuration has been corrupted. For reset and force_reset to
# succeed the RabbitMQ application must have been stopped, e.g. with stop_app.
#
# Usage:
# rabbitmq::ctl::force_reset
#
define rabbitmq::ctl::force_reset() {

	exec { "force_reset": command => "/usr/sbin/rabbitmqctl force_reset" }

}
