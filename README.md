# Greatest Per Group Queries in Rails

This app demonstrates the techniques described [in a series of blog posts about
Greatest Per Group queries][blog] and how to achieve them in Ruby on Rails
(using PostgreSQL).

[blog]: http://www.toasterlovin.com/greatest-per-group-postgresql-distinct-on/

## Requirements

- Ruby 3.4 (see `.ruby-version`)
- PostgreSQL

## Installation

```
git clone https://github.com/toasterlovin/rails-greatest-per-group.git
cd rails-greatest-per-group
bin/setup
```

`bin/setup` installs gems, creates and seeds the database, and starts the
server. Then just visit `localhost:3000` in your browser.

## Tests

```
bin/rails test   # just the tests
bin/ci           # tests, RuboCop, Brakeman and dependency audits
```
