class beryjuorg_monitoring::helper_rke {

  cron { 'etcd_export':
    command => "bash -c \"curl -s --cacert /etc/kubernetes/ssl/kube-ca.pem --cert $(find /etc/kubernetes/ssl/ -name 'kube-etcd-*' | grep -v key) --key $(find /etc/kubernetes/ssl/ -name 'kube-etcd-*key.pem') https://localhost:2379/metrics > /var/lib/prometheus/node-exporter/etcd.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }
  cron { 'controller-manager_export':
    command => "bash -c \"curl -s --cacert /etc/kubernetes/ssl/kube-ca.pem --cert /etc/kubernetes/ssl/kube-controller-manager.pem --key /etc/kubernetes/ssl/kube-controller-manager-key.pem https://localhost:10257/metrics > /var/lib/prometheus/node-exporter/rke-controller-manager.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }
  cron { 'scheduler_export':
    command => "bash -c \"curl -s --cacert /etc/kubernetes/ssl/kube-ca.pem --cert /etc/kubernetes/ssl/kube-scheduler.pem --key /etc/kubernetes/ssl/kube-scheduler-key.pem https://localhost:10259/metrics > /var/lib/prometheus/node-exporter/rke-scheduler.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}
