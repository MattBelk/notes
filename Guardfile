# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest, spring: "bin/rails test" do
  # with Minitest::Unit
  watch(%r{^test/(.*)/?(.*)_test\.rb$})
  # watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$}) { 'test' }

  # Watches routes
  watch('config/routes.rb') { interface_tests }

  # Watches webpacker js files
  watch(%r{^app/javascript/(.*)/?(.*)\.js$}) { interface_tests }

  # Watches view layouts
  watch(%r{app/views/layouts/*}) { interface_tests }

  # Watches models
  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
    "test/models/#{matches[1]}_test.rb"
  end

  # Watches controllers
  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    resource_tests(matches[1])
  end

  # Watches views
  watch(%r{^app/views/([^/]*?)/.*\.(html|js)\.erb$}) do |matches|
    ["test/controllers/#{matches[1]}_controller_test.rb"] +
    integration_tests(matches[1])
  end

  # Watches helpers
  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
    integration_tests(matches[1])
  end

  # Watches mailers
  watch(%r{^app/mailers/(.*?)\.rb$}) do |matches|
    "test/mailers/#{matches[1]}_test.rb"
  end

  watch('app/views/layouts/application.html.erb') do
    'test/integration/site_layout_test.rb'
  end
  

  # ADD ANY SPECIFIC/ODDLY NAMED THINGS BELOW HERE e.g.
  # watch('app/controllers/sessions_controller.rb') do
  #   ['test/controllers/sessions_controller_test.rb',
  #    'test/integration/users_login_test.rb']
  # end
  # watch('app/controllers/account_activations_controller.rb') do
  #   'test/integration/users_signup_test.rb'
  # end




end


# Returns the integration tests corresponding to the given resource.
def integration_tests(resource = :all)
  if resource == :all
    Dir["test/integration/*"]
  else
    Dir["test/integration/#{resource}_*.rb"]
  end
end

# Returns all tests that hit the interface.
def interface_tests
  integration_tests << "test/controllers/"
end

# Returns the controller tests corresponding to the given resource.
def controller_test(resource)
  "test/controllers/#{resource}_controller_test.rb"
end

# Returns all tests for the given resource.
def resource_tests(resource)
  integration_tests(resource) << controller_test(resource)
end