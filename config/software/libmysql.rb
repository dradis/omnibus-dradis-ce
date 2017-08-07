#
# Copyright 2013, Craig Tracey <craigtracey@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
name    "libmysql"
default_version "6.1.5"

source :url => "http://mirror.cogentco.com/pub/mysql/Connector-C/mysql-connector-c-#{version}-src.tar.gz",
  :md5 => "50837220daf43a60890b0af6bfdf5a54"

relative_path "mysql-connector-c-#{version}-src"

env = {
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
}

#env = with_standard_compiler_flags(with_embedded_path)
#env.merge!(
#  "CXXFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
#  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
#)

build do

  command ["which cmake"], :env => env
  command ["file #{install_dir}/embedded/lib/libssl.so"], :env => env
  command ["file #{install_dir}/embedded/lib/libz.so"], :env => env
  command ["file #{install_dir}/embedded/lib/libcrypto.so"], :env => env

  command [ "cmake",
	"-DCMAKE_INSTALL_PREFIX=#{install_dir}/embedded",
	".",
	].join(" "), :env => env
  command "make -j install"
end
