class beryjuorg_monitoring::helper_etcd {

  cron { 'etcd_export':
    command => "bash -c \"curl -s --cacert /etc/kubernetes/ssl/kube-ca.pem --cert $(find /etc/kubernetes/ssl/ -name 'kube-etcd-*' | grep -v key) --key $(find /etc/kubernetes/ssl/ -name 'kube-etcd-*key.pem') https://localhost:2379/metrics > /var/lib/prometheus/node-exporter/etcd.prom\"",
    user    => 'root',
    hour    => "*",
    minute  => "*",
  }

}
