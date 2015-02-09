# Gitlab Server Parameters
default['gitlab']['external_url'] = "https://gitlab.local"
default['gitlab']['omnibus']['in_repo'] = false

default['gitlab']['ssl']['organization'] = 'ChefLab'
default['gitlab']['ssl']['organizational_unit'] = 'Ops'
default['gitlab']['ssl']['country'] = 'US'
default['gitlab']['ssl']['http_redirect'] = true