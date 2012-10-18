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

['.bashrc', '.bash_profile', '.bash_aliases', '.gitconfig', '.ctags', '.hgrc', '.pylintrc', '.screenrc', 'bin', '.pip'].each do |file|
    link "#{node[:dotfiles][:home]}/#{file}" do
        to "#{node[:dotfiles][:target]}/#{file}"
        owner "#{node[:dotfiles][:user]}"
        group "#{node[:dotfiles][:user]}"
    end
end

execute "git clone --recursive #{node[:dotfiles][:vimsource]}" do
    cwd "#{node[:dotfiles][:home]}"
    user "#{node[:dotfiles][:user]}"
    group "#{node[:dotfiles][:user]}"
    not_if { File.directory?("#{node[:dotfiles][:home]}/.vim") }
end

cookbook_file "#{node[:dotfiles][:home]}/.vimrc" do
    source ".vimrc"
    owner "#{node[:dotfiles][:user]}"
    group "#{node[:dotfiles][:user]}"
end
