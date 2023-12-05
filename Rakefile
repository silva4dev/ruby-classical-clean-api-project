task 'test' do
  system('bundle exec rspec')
end

task 'test:unit' do
  system('bundle exec rspec --pattern "src/**/*_spec.rb"')
end

task 'test:integration' do
  system('bundle exec rspec --pattern "src/**/*_test.rb"')
end
