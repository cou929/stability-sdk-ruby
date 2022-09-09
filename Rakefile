require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test

desc "Parse proto file and generate output"
task :protoc do
  sh "grpc_tools_ruby_protoc -I api-interfaces/src/proto/ --ruby_out=lib --grpc_out=lib api-interfaces/src/proto/generation.proto"
end
