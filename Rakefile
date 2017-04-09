desc "Compile Action Cable assets"
task :compile do
  require "blade"
  require "sprockets"
  require "sprockets/export"

  Blade.build
end

desc "Verify compiled Action Cable assets"
task :verify do
  require "pathname"
  require "open3"

  dir = File.dirname(__FILE__)
  file = "dist/action_cable.js"
  pathname = Pathname.new("#{dir}/#{file}")

  print "[verify] #{file} exists "
  if pathname.exist?
    puts "[OK]"
  else
    $stderr.puts "[FAIL]"
    fail
  end

  print "[verify] #{file} is a UMD module "
  if pathname.read =~ /module\.exports.*define\.amd/m
    puts "[OK]"
  else
    $stderr.puts "[FAIL]"
    fail
  end

  print "[verify] #{dir} can be required as a module "
  stdout, stderr, status = Open3.capture3("node", "--print", "window = {}; require('#{dir}');")
  if status.success?
    puts "[OK]"
  else
    $stderr.puts "[FAIL]\n#{stderr}"
    fail
  end
end

task :default => %w( compile verify )
