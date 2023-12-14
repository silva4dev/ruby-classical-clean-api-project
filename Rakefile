task "test" do
  system("bundle exec rspec")
end

task "test:unit" do
  system("bundle exec rspec --pattern 'tests/unit/**/*_spec.rb'")
end

task "test:integration" do
  system("bundle exec rspec --pattern 'tests/integration/**/*_spec.rb'")
end
