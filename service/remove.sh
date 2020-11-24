#!/bin/sh

for cl in ${pwd}/clusters/*.json; do greymatter delete cluster < $cl; done
for cl in ${pwd}/domains/*.json; do greymatter delete domain < $cl; done
for cl in ${pwd}/listeners/*.json; do greymatter delete listener < $cl; done
for cl in ${pwd}/proxies/*.json; do greymatter delete proxy < $cl; done
for cl in ${pwd}/rules/*.json; do greymatter delete shared_rules < $cl; done
for cl in ${pwd}/routes/*.json; do greymatter delete route < $cl; done

curl -k -XDELETE --cert $GREYMATTER_API_SSLCERT --key $GREYMATTER_API_SSLKEY https://$GREYMATTER_API_HOST/services/catalog/latest/clusters/{{ variable "serviceName" }}
