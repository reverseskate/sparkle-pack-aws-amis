# sparkle-pack-aws-amis
SparklePack for Offical Ubuntu and Amazon Linux AWS AMIs

## Use Cases
This SparklePack provides mappings for official Ubuntu LTS and Amazon Linux AMIs in all regions. It is useful for scenarios when you need cross-region and/or cross-platform compatibility, and do not want to maintain a list of AMIs in your codebase. Pinning to an exact gem version will ensure that you always get the same AMI.

Instance type and virtualization can be tuned via optional config arguments, and the set of available operating systems can also be trimmed according to preference.

### Note: Semantic Versioning
"Breaking changes" in the context of this pack are changes that affect the _usage_ of the pack in your SparkleFormation codebase. Updated AMIs are _not_ considered "breaking." Revisions may include updates to the AMI ID for existing platforms. Minor changes may include new platforms.

## Usage
Add the pack to your Gemfile and .sfn:

Gemfile:
```ruby
source 'https://rubygems.org'

gem 'sfn'
gem 'sparkle-pack-aws-amis'
```

.sfn:
```ruby
Configuration.new do
  sparkle_pack [ 'sparkle-pack-aws-amis' ]
  ...
end
```

In a SparkleFormation Template/Component/Dynamic:
```ruby
registry!(:offical_amis, :name)

resources do
  ec2_instance do
  type 'AWS::EC2::Instance'
  properties do
    image_id map!(:official_amis, region!, 'trusty')
    ...
  end
end
```

The `:official_amis` registry accepts the following configuration options as additional arguments:
* `:type` String: `instance_store` (default), `ebs`, `ebs_io1`, `ebs_ssd`. Amazon AMIs are not available for `ebs` or `ebs_io1`
* `:virt` String: `hvm` (default) or `pv`
* `:os_versions` Array: `['ubuntu_14', 'ubuntu_12', 'amazon_2015_09']` (default) or a subset.
