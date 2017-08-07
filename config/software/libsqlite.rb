name    "libsqlite"
default_version "3190300"

dependency "libreadline"

source  :url => "http://www.sqlite.org/2017/sqlite-autoconf-#{version}.tar.gz",
  :sha1 => "58f2cabffb3ff4761a3ac7f834d9db7b46307c1f"

relative_path "sqlite-autoconf-#{version}"

#env = {
#  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
#}

env = with_standard_compiler_flags(with_embedded_path)
env.merge!(
  "CXXFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
)

build do
  command "./configure --prefix=#{install_dir}/embedded"
  command "make", :env => env
  command "make install"
end
