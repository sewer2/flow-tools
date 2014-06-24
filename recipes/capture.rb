#
# Cookbook Name:: flow-tools
# Recipe:: capture
#
# Copyright 2014, sewer
#
# All rights reserved - Do Not Redistribute
#

service 'flow-capture' do
  supports :restart => true
  action [ :enable, :start ]
end

capture = {}
node['flow-tools']['capture'].each do |capture_name, capture_opt|
  capture_params = ''
  lrp = node['flow-tools']['capture_lrp']
  workdir = node['flow-tools']['capture_workdir']
  capture_opt.each do |opt_key, opt_value|
    case opt_key
      when 'param'
        opt_value.each do |key, value|
          capture_params = [capture_params, key, value.to_s].join(' ')
        end
      when 'lrp'
        lrp = opt_value.to_s
      when 'workdir'
        workdir = opt_value['name']
        directory workdir do
          user opt_value['user'] || node['flow-tools']['user']
          group opt_value['group'] || node['flow-tools']['group']
          mode opt_value['mode'] || node['flow-tools']['mode']
          recursive true
          action :create
        end
    end
  end
  capture_params = [capture_params, '-w',  workdir, lrp].join(' ')
  capture[capture_name.to_s] = capture_params.to_s
end

template '/etc/flow-tools/flow-capture.conf' do
  owner 'root'
  group 'root'
  mode 0644
  variables( :capture => capture )
  source 'flow-capture.erb'
  notifies :restart, 'service[flow-capture]'
end

