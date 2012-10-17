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
end
