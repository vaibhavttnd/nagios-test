#
# Cookbook Name:: spinen-grails
# Attribute file:: default
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#

default['grails']['version'] = '2.5.1'#vaibhav
default['grails']['home'] = '/usr/local/grails'
default['grails']['url'] = "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-#{node['grails']['version']}.zip"
default['grails']['checksum'] = '8e2d8be08f6e03c7dbe2a87d4e81882d859d014b2da294cefcce44175457d2ed'
