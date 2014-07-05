#!/bin/bash
sudo varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret 'ban req.url ~ ".*"'

