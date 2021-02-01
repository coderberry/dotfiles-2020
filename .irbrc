require "rubygems"
require "amazing_print"
AmazingPrint.irb!

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

def load_yaml_fixture(path)
  absolute_path = File.join(RAILS_ROOT, "test", "fixtures", path)
  YAML::load_file absolute_path
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

alias q exit
