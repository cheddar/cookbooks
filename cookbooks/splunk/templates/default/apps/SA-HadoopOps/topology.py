#!/usr/bin/env python

import sys
from string import join

DEFAULT_RACK = '/default/rack';

RACK_MAP = {
<% @hadoop_nodes.each do |n| %>
  '<%= n[:fqdn] %>': '<%= n[:hadoop][:rack_id] %>',
<% end %>
}

if len(sys.argv)==1:
    print DEFAULT_RACK
else:
    print join([RACK_MAP.get(i, DEFAULT_RACK) for i in sys.argv[1:]]," ")
