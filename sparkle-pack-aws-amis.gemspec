Gem::Specification.new do |s|
  s.name = 'sparkle-pack-aws-amis'
  s.version = '0.1.1'
  s.licenses = ['MIT']
  s.summary = 'AWS AMI SparklePack'
  s.description = 'SparklePack to provide mappings for Official Amazon and Ubuntu AMIs by region'
  s.authors = ['Michael F. Weinberg']
  s.email = 'michael@heavywater.io'
  s.homepage = 'http://sparkleformation.io'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-aws-amis.gemspec lib/sparkle-pack-aws-amis.rb)
  s.add_runtime_dependency 'sparkle_formation'
end
  
