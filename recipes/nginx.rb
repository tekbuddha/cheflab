require 'base64'

include_recipe 'nginx'

template '/etc/nginx/sites-available/graphite' do
  source 'graphite-proxy.conf.erb'
  notifies :reload, 'service[nginx]'
  mode '0644'
  owner 'root'
  group 'root'
  # variables(
  #   es_scheme: node['grafana']['es_scheme'],
  #   es_server: node['grafana']['es_server'],
  #   es_port: node['grafana']['es_port'],
  #   graphite_scheme: node['grafana']['graphite_scheme'],
  #   graphite_server: node['grafana']['graphite_server'],
  #   graphite_port: node['grafana']['graphite_port'],
  #   server_name: node['grafana']['webserver_hostname'],
  #   server_aliases: node['grafana']['webserver_aliases'],
  #   grafana_dir: node['grafana']['web_dir'],
  #   listen_address: node['grafana']['webserver_listen'],
  #   listen_port: node['grafana']['webserver_port'],
  #   es_basic_auth: es_basic_auth.to_s,
  #   graphite_basic_auth: graphite_basic_auth.to_s
  # )
end

nginx_site 'graphite' do
  template false
end