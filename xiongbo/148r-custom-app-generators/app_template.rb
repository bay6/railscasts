remove_file "README.doc"
create_file "README.md", "TODO"

gem "rspec-rails", group: [:test, :development]
run "bundle install"

generate "rspec:install"

if yes? "Do you want to generate a root controller"
  name = ask("What should it be called?").underscore
  generate :controller, "#{name} index"
  route "root to: '#{name}\#index'"
end

git :init
append_file ".gitignore", "config/database.yml"
run "cp config/database.yml config/example_databas.yml"
git add: ".", commit: "-m 'initial commit'"
