#!/usr/bin/env ruby

require File.expand_path("../../.lib/global", $0)

mount_union

Dir.chdir File.expand_path("../union", $0)

write "lib/init/fstab", <<-EOS
# nothing
EOS

# Disable unneeded services
sh "rm -f etc/init/ureadahead*"
sh "rm -f etc/init/plymouth*"
sh "rm -f etc/init/hwclock*"
sh "rm -f etc/init/hostname*"
sh "rm -f etc/init/*udev*"
sh "rm -f etc/init/module-*"
sh "rm -f etc/init/mountall-*"
sh "rm -f etc/init/mounted-*"
sh "rm -f etc/init/dmesg*"
sh "rm -f etc/init/network-*"
sh "rm -f etc/init/procps*"
sh "rm -f etc/init/rcS*"
sh "rm -f etc/init/rsyslog*"

# Don't run ntpdate when container network comes up
sh "rm -f etc/network/if-up.d/ntpdate"

# Don't run cpu frequency scaling
sh "rm -f etc/rc*.d/S*ondemand"
