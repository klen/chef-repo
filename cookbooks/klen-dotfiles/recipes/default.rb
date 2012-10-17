#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2012, Kirill Klenov

package "git"

execute "git clone git://github.com/klen/.home.git" do
    cwd "/home/klen"
    user "klen"
    group "klen"
    not_if { File.directory?("/home/klen/.home") }
end

execute "make install" do
    cwd "/home/klen/.home"
    user "klen"
    group "klen"
end
