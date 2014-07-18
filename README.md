# TokuMX Puppet Module for Boxen

[![Build Status](https://travis-ci.org/crowdtap/puppet-tokumx.png)](https://travis-ci.org/crowdtap/puppet-tokumx)

## Usage

```puppet
include tokumx
```

## Required Puppet Modules

* boxen
* homebrew
* stdlib

## Environment

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_MONGODB_PORT: the configured TokuMX port
* BOXEN_MONGODB_URL: the URL for TokuMX, including localhost & port
* BOXEN_TOKUMX_PORT: the configured TokuMX port
* BOXEN_TOKUMX_URL: the URL for TokuMX, including localhost & port

### Ruby

For the [ruby client](http://api.mongodb.org/ruby/current/):

```ruby
@client = Mongo::MongoClient.new('localhost', ENV['BOXEN_MONGODB_PORT'] || 27017)
```

For [mongomapper](http://mongomapper.com/)'s `config/mongo.yml`:

```yaml
development:
  uri: <%= ENV['BOXEN_MONGODB_URL'] || 'mongodb://localhost:27017/' %>
```
