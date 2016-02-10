require 'rspec'

def safely_require(file)
  require_relative file
rescue LoadError
end

# Libs
# safely_require ''
