# Define: rabbitmq::ctl::cluster
#
# Instruct the node to become member of a cluster with the specified nodes. To
# cluster with currently offline nodes, use force_cluster.
#
# Cluster nodes can be of two types: disk or ram. Disk nodes replicate data in
# ram and on disk, thus providing redundancy in the event of node failure and
# recovery from global events such as power failure across all nodes. Ram nodes
# replicate data in ram only and are mainly used for scalability. A cluster
# must always have at least one disk node.
#
# If the current node is to become a disk node it needs to appear in the
# cluster node list. Otherwise it becomes a ram node. If the node list is empty
# or only contains the current node then the node becomes a standalone, i.e.
# non-clustered, (disk) node.
#
# After executing the cluster command, whenever the RabbitMQ application is
# started on the current node it will attempt to connect to the specified
# nodes, thus becoming an active node in the cluster comprising those nodes
# (and possibly others).
#
# The list of nodes does not have to contain all the cluster's nodes; a subset
# is sufficient. Also, clustering generally succeeds as long as at least one of
# the specified nodes is active. Hence adjustments to the list are only
# necessary if the cluster configuration is to be altered radically.
#
# For this command to succeed the RabbitMQ application must have been stopped,
# e.g. with stop_app. Furthermore, turning a standalone node into a clustered
# node requires the node be reset first, in order to avoid accidental
# destruction of data with the cluster command.
#
# For more details see the clustering guide:
# http://www.rabbitmq.com/clustering.html
#
# Usage:
# rabbitmq::ctl::cluster { "cluster":
# 	$clusternode = "rabbit@q0",
# 	$other_nodes = "rabbit@q1 rabbit@q2"
# }
#
define rabbitmq::ctl::cluster($clusternode, $other_nodes = '') {

	exec { "cluster": command => "/usr/sbin/rabbitmqctl cluster '$clusternode' '$other_nodes'" }

}
