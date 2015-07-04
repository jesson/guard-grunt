# guard-grunt

Guard::Grunt is a [Guard](http://guardgem.org/) plugin to automatically
start/stop/restart grunt.

### Getting Started

Before you need to [install
Grunt](http://gruntjs.com/getting-started)!

If you're using Bundler, you can add guard-grunt to your Gemfile:

```ruby
gem 'guard-grunt'
```

Or manually install the guard-grunt gem:

```shell
gem install guard-grunt
```

Add the guard definition to your Guardfile by running this command:

```shell
guard init grunt
```

### Guardfile

```ruby
guard 'grunt' do
  watch(%r{^Gruntfile.js$})
end
```

### Contributing

Fork, branch, and pull-request.
