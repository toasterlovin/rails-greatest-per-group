# Greatest Per Group Queries in Rails

This app demonstrates the techniques described [in  a series of blog posts about
Greatest Per Group queries][blog] and how to achieve them in Ruby on Rails
(using PostreSQL).

You can see it in action at [http://rails-greatest-per-group.herokuapp.com][web]

[blog]: http://rails-greatest-per-group.herokuapp.com
[web]: http://www.toasterlovin.com/greatest-per-group-postgresql-distinct-on/

## Installation

```
git clone https://github.com/toasterlovin/rails-greatest-per-group.git
cd rails-greatest-per-group
bundle install
rake db:setup
rails server
```

Then just visit `localhost:5000` in your browser.

#### Using Vagrant

Alternately, you can use Vagrant if you don't want to install a bunch of
software on your local machine:

```
git clone https://github.com/toasterlovin/rails-greatest-per-group.git
cd rails-greatest-per-group
vagrant up
vagrant ssh       # everything past here happens inside the virtual machine
cd /vagrant
bundle install
rake db:setup
rails server
```

Then just visit `localhost:8008` in your browser.
