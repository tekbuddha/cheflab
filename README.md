# cheflab

Yo dawg! I heard you'd like a quick and easy way to get lots of Chef workflowy stuff on your laptop. Yeah? Cool. Let's roll!

## THERE BE DRAGONS HERE

**NOTE: This is incredibly crude and far from ideal but addresses my immediate goals. Significant refactoring over time will be necessary to make this consumable by more than just myself.**

**Unfortunately some of the dependent cookbooks are currently in private repos. This may or may not change in the future. For those pieces currently in private repos, there are public alternatives, I'm certain.**

I've had in my mind for a long while now that those of us who frequently talk about what a full Chef eco-system looks like needed a way to quickly demonstrate it to customers, friends, family, and pets. (My own doge gets particularly excited when I *YALP!* at success of all these boxes converging...). Ultimately, the automation workflow (local development + services) in a box.

My goal is to have a quick and easy manner to standup:

- Chef Server
	- Manage UI
	- Reporting
	- Push
- Chef Analytics *optional*
- Chef Supermarket *optional* **TODO**
- Two (2) Test Nodes for applying recipes
- Gitlab for chef-repo, custom cookbooks, etc
- Jenkins for auto-build/test/deploy capabilities **STARTED/NOT YET COMPLETE**
- ELK Stack **TODO**
- Graphite/Grafana (thanks to Scott Ford for the lead on Grafana!)
    - graphite runs on :8080
    - grafana runs on :3000
- Nagios/Zenoss/something for service availability checks **TODO**

Inspiration for this bundle has come from being on-site with various customers, conversation with fellow engineers, and a desire to have an all-in-one way to quickly demonstrate a way that many of us now find to be the prescriptive way to work with and support Chef.


## Requirements

- A semi-modern laptop with enough CPU + RAM to handle the number of instances
- Kitchen
- Berkshelf
*Just use ChefDK!*
- Vagrant
- VirtualBox


### Platform:

CentOS 6.6

I don't believe there's anything platform specific here, but I haven't tested with anything other than CentOS just yet.


### Cookbooks:

This is really just a larger wrapper cookbook with a nice `kichen.yml` file.

* [chef-server12](https://github.com/tekbuddha/chef-server12): manages chef server components/addons and more. Forked from Mischa Taylor's excellent original.
* [gitlab](https://github.com/chef-solutions/gitlab): manages gitlab server. Original by Stephen Lauck.

The `jenkins` recipe within is derived from Stephen Lauck's [pipeline](https://github.com/chef-solutions/pipeline) cookbook. Stephen's does great at actually creating jobs to poll a Gitlab instance for commits (which I'd like to add as well) but it felt very "heavy" in how it was accomplished. I'd like to model the [cooking-with-jenkins](https://github.com/zts/cooking-with-jenkins) approach but haven't yet got time to put it together.


## Attributes

**chef-server12**

* `['feature']['opscode-manage']`: enable/disable Manage UI
* `['feature']['opscode-reporting']`: enable/disable Reporting
* `['feature']['chef-sync']`: enable/disable Sync
* `['feature']['opscode-push-jobs-server']`: enable/disable Push Jobs
* `['analytics']`: enable/disable Analytics (**note**: *requires analytics VM to exist!*)

There are other tuneables in `chef-server.rb` for organization name, adminsitrator user/password, etc. 

## Usage

I keep the following in my `/etc/hosts` file:

```
192.168.33.33   chefserver.local
192.168.33.34   analytics.local
192.168.33.35   supermarket.local
192.168.33.53   node1.local
192.168.33.54   node2.local
192.168.33.64   gitlab.local
192.168.33.65   jenkins.local
192.168.33.66   graphite.local
192.168.33.67   grafana.local
```

Adjust accordingly if you alter the IPs at the top of the `.kitchen.yml`.

The `.kitchen.yml` has suites ordered properly for a clean build. You should be able to `kitchen converge` and the result will be all the nodes and services up and running. Build time on my MacBook is roughly 25min for the entire suite.


## Documentation

This README serves as the only documentation for the cookbook at this time.



## License and Author

- Author: John Martin <jmartin@chef.io> or <tekbuddha@gmail.com>

With Material Lifted From:

- Author: Stephen Lauck <lauck@chef.io>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
