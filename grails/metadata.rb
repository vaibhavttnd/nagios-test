name             'grails'
maintainer       'grails'
maintainer_email  'luke.reimer@spinen.com' 
license          'MIT'
description      'Installs/Configures grails'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION'))

%w(
  ark
).each do |cookbook|
  depends cookbook
end

supports 'ubuntu'
