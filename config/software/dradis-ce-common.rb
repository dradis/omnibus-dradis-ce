name "dradis-ce"
default_version "master"

dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "libmysql"
dependency "libsqlite"
dependency "git"
dependency "redis"

source :git => "https://github.com/dradis/dradis-ce.git"

env = {
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
}

build do
	copy "#{project_dir}/Gemfile.plugins.template", "#{project_dir}/Gemfile.plugins"
	bundle "install --path=#{install_dir}/embedded/lib"
	gem "install rails"
	copy "#{project_dir}/config/database.yml.template", "#{project_dir}/config/database.yml"
	bundle "exec rails db:migrate"
	mkdir "#{install_dir}/project"
	sync "#{project_dir}", "#{install_dir}/project"
end
