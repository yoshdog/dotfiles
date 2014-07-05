require 'awesome_print'
AwesomePrint.pry!
Pry.config.prompt = [proc { "#{RUBY_VERSION} >> " },
                     proc { "       | " }]
