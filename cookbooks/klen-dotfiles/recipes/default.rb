#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2012, Kirill Klenov

package "git"

execute "git clone #{node[:dotfiles][:source]} #{node[:dotfiles][:target]}" do
    cwd "#{node[:dotfiles][:home]}"
    user "#{node[:dotfiles][:user]}"
    group "#{node[:dotfiles][:user]}"
    not_if { File.directory?("#{node[:dotfiles][:target]}") }
end

link "#{node[:dotfiles][:home]}/.bashrc" do
    to "#{node[:dotfiles][:target]}/.bashrc"
    owner "#{node[:dotfiles][:user]}"
    group "#{node[:dotfiles][:user]}"
end
