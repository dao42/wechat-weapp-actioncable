source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gemspec

# We need a newish Rake since Active Job sets its test tasks' descriptions.
gem "rake", ">= 11.1"

# Action Cable
group :cable do
  gem "puma", require: false

  gem "em-hiredis", require: false
  gem "hiredis", require: false
  gem "redis", require: false

  gem "websocket-client-simple", github: "matthewd/websocket-client-simple", branch: "close-race", require: false

  gem "blade", require: false, platforms: [:ruby]
  gem "blade-sauce_labs_plugin", require: false, platforms: [:ruby]
  gem "sprockets-export", require: false
end
