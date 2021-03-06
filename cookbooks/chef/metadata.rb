# encoding: utf-8

description "The Chef Server"

maintainer "Benedikt Böhm"
maintainer_email "bb@xnull.de"
license "Apache v2.0"

version "5.0.3"

supports "debian"
supports "gentoo"

depends "java"
depends "nagios"
depends "nginx"
depends "openssl"
depends "splunk"
