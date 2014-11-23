require 'awesome_print'
require 'hirb'
AwesomePrint.pry!
Hirb.enable({width: 155, height: 500})
Pry.config.prompt = [proc { "#{RUBY_VERSION} >> " },
                     proc { "       | " }]

Hirb.enable
old_print = Pry.config.print
Pry.config.print = proc do |output, value|
      Hirb::View.view_or_page_output(value) || old_print.call(output, value)
end
