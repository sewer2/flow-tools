#
# Cookbook Name:: cookbook-flow-tools
# Recipe:: default
#
# Copyright 2014, sewer
#
# All rights reserved - Do Not Redistribute
#
package "flow-tools"

service "flow-capture" do
  supports :restart => true
  action [ :enable, :start ]
end

template "/etc/flow-tools/flow-capture.conf" do
  owner "root"
  group "root"
  mode 0644
  source "flow-capture.erb"
  notifies :restart, "service[flow-capture]"
end
