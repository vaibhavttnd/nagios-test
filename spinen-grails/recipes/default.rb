#
# Cookbook Name:: spinen-grails
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#

include_recipe 'ark::default'

ark 'grails' do
  url node['grails']['url']
  checksum node['grails']['checksum']
  home_dir node['grails']['home']
  version node['grails']['version']
end
