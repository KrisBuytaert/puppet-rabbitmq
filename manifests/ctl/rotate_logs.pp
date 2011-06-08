# Define: rabbitmq::ctl::rotate_logs
#
# Instruct the RabbitMQ node to rotate the log files.
#
# The RabbitMQ broker will attempt to append the current contents of the log
# file to the file with name composed of the original name and the suffix. It
# will create a new file if such a file does not already exist. When no suffix
# is specified, the empty log file is simply created at the original location;
# no rotation takes place.
#
# When an error occurs while appending the contents of the old log file, the
# operation behaves in the same way as if no suffix was specified.
#
# This command might be helpful when you are e.g. writing your own logrotate
# script and you do not want to restart the RabbitMQ node.
#
# Usage:
# rabbitmq::ctl::rotate_logs
#
define rabbitmq::ctl::rotate_logs($suffix) {

	exec { "rotate_logs": command => "/usr/sbin/rabbitmqctl rotate_logs '$suffix'" }

}
