# Define: rabbitmq::ctl::force_cluster
#
# Instruct the node to become member of a cluster with the specified nodes.
# This will succeed even if the specified nodes are offline. For a more
# detailed description, see cluster.
#
# Note that this variant of the cluster command just ignores the current status
# of the specified nodes. Clustering may still fail for a variety of other
# reasons.
#
# Usage:
# rabbitmq::ctl::force_cluster { "force_cluster":
# 	$clusternode = "rabbit@q0",
# 	$other_nodes = "rabbit@q1 rabbit@q2"
# }
#
define rabbitmq::ctl::force_cluster($clusternode, $other_nodes = '') {

	exec { "force_cluster": command => "/usr/sbin/rabbitmqctl force_cluster '$clusternode' '$other_nodes'" }

}
