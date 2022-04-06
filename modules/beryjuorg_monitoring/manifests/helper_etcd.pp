class beryjuorg_monitoring::helper_etcd {

  $host = regsubst($fqdn, '\.', '-', 'G')

  cron { 'etcd_export':
    command => "bash -c \"curl --cacert /etc/kubernetes/ssl/kube-ca.pem --cert /etc/kubernetes/ssl/kube-etcd-${host}.pem --key /etc/kubernetes/ssl/kube-etcd-${host}-key.pem https://localhost:2379/metrics > /var/lib/prometheus/node-exporter/etcd.prom\"",
    user    => 'root',
    hour    => "*",
    minute  => "*",
  }

}
