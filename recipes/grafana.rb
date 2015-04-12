#
# Cookbook Name:: cheflab
# Recipe:: grafana
#
# Copyright (c) 2015 John Martin, All Rights Reserved.

package "grafana" do
	source "#{node['grafana']['package']['url']}"
	action :install
	
	provider Chef::Provider::Package::Rpm
end

service "grafana" do
	action [ :enable, :start ]
end