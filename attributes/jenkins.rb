# We need some Jenkins plugins for this thing to work..
default['cheflab']['jenkins']['plugins'] = %w{ scm-api ssh-agent git git-client github-api github chef-identity }

# Which version of java for Jenkins?...
default['java']['jdk_version'] = '7'

# Which version of ChefDK?...
default['cheflab']['chefdk']['version'] = 'latest'