default[:php][:default_use_flags] = %w(-* bzip2 crypt ctype curl exif filter ftp gd hash iconv imap json mysql mysqli mysqlnd nls pcre pdo posix reflection session simplexml soap sockets spl sqlite3 ssl tokenizer truetype unicode xml zlib zip)
default[:php][:use_flags] = []
default[:php][:sapi] = %w(cli)

default[:php][:tmp_dir] = "/var/tmp/php"

# misc php settings
default[:php][:short_open_tag] = "On"
default[:php][:allow_call_time_pass_reference] = "Off"
default[:php][:display_errors] = "Off"
default[:php][:expose_php] = "Off"
default[:php][:magic_quotes_gpc] = "Off"
default[:php][:max_execution_time] = "30"
default[:php][:max_input_nesting_level] = "64"
default[:php][:max_input_time] = "60"
default[:php][:memory_limit] = "128M"
default[:php][:post_max_size] = "8M"
default[:php][:realpath_cache_size] = "16k"
default[:php][:register_argc_argv] = "Off"
default[:php][:register_globals] = "Off"
default[:php][:register_long_arrays] = "Off"

# session settings
default[:php][:session][:auto_start] = "0"
default[:php][:session][:lifetime] = "60"
default[:php][:session][:save_path] = "#{node[:php][:tmp_dir]}/sessions"
default[:php][:session][:use_only_cookies] = "1"

# upload settings
default[:php][:upload][:max_filesize] = "2M"
default[:php][:upload][:tmp_dir] = "#{node[:php][:tmp_dir]}/uploads"

# create default fpm pool
default[:php][:fpm][:conf] = nil
default[:php][:fpm][:pools][:default] = {}

# get current php slot
if node[:platform] == "gentoo"
  default[:php][:slot] = %x(eix --pure-packages --format '<bestversion:NAMEASLOT>' -e dev-lang/php|cut -d: -f2).chomp
end

# infer extension dir
default[:php][:extension_dir] = if File.exist?("/usr/bin/php-config")
                                  %x(/usr/bin/php-config --extension-dir).chomp
                                else
                                  "/does/not/exist"
                                end
