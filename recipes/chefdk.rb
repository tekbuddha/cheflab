chef_dk 'cheflab_chefdk' do
  version node['cheflab']['chefdk']['version']
  global_shell_init true
  action :install
end