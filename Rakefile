task "start" do
  system("ruby ./src/main/app/sinatra/server.rb")
end

task "start:dev" do
  system("bundle exec rerun --pattern 'src/**/*.{rb}' 'rackup -p 3333 -r ./src/main/app/sinatra/server.rb -s puma'")
end

task "test" do
  system("bundle exec rspec")
end

task "test:unit" do
  system("bundle exec rspec --pattern 'tests/unit/**/*_spec.rb'")
end

task "test:integration" do
  system("bundle exec rspec --pattern 'tests/integration/**/*_spec.rb'")
end
