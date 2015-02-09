
# Premium features:
# chef-ha, chef-sync, opscode-analytics, opscode-manage,
# opscode-push-jobs-server, opscode-reporting
default['chef_server12']['feature']['opscode-manage'] = true
default['chef_server12']['feature']['opscode-reporting'] = true
default['chef_server12']['feature']['chef-sync'] = false
default['chef_server12']['feature']['opscode-push-jobs-server'] = true
# Premium features that aren't plugins
default['chef_server12']['analytics'] = true

# Chef Server Parameters
default['chef_server12']['api_fqdn'] = node['ipaddress']
default['chef_server12']['topology'] = 'standalone'
default['chef_server12']['write_hosts'] = false

default['chef_server12']['admin_username'] = 'chefadmin'
default['chef_server12']['admin_firstname'] = 'Chef'
default['chef_server12']['admin_lastname'] = 'Admin'
default['chef_server12']['admin_email'] = 'chef@chefadmin.com'
default['chef_server12']['admin_password'] = 'chefadmin'
default['chef_server12']['admin_private_key_path'] = '/tmp/chefadmin.pem'
default['chef_server12']['organization'] = 'cheflab'
default['chef_server12']['organization_long_name'] = 'CHEF Lab Organization'
default['chef_server12']['organization_private_key'] = \
   "#{node['chef_server12']['organization']}-validator.pem"
default['chef_server12']['organization_private_key_path'] = \
   File.join('/tmp', node['chef_server12']['organization_private_key'])