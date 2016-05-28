#
# Cookbook Name:: spinen-grails
# Attribute file:: default
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#

default['grails']['version'] = '2.3.11'
default['grails']['home'] = '/usr/local/grails'
default['grails']['url'] = "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-#{node['grails']['version']}.zip"
default['grails']['checksum'] = 'c53e01a9d98c499f91d7c7d54312dbdfd33f99ffcdec8bc4946036e4bea2c8e1'