SfnRegistry.register(:official_amis) do |_name, _config = {}|

  type = _config.fetch(:type, 'instance')
  virt = _config.fetch(:virt, 'hvm')
  os_versions = _config.fetch(:os_versions, ['xenial', 'trusty', 'precise', 'amazon'])
  ami_release = _config.fetch(:ami_release, 'latest')

  ami_hash = {}

  os_versions.each do |os|
    release_hash = registry!("#{os}_amis".to_sym)
    if ami_release == 'latest'
      latest_release = release_hash['latest']
      ami_hash[os] = release_hash['releases'][latest_release]
    else
      ami_hash[os] = release_hash['releases'][ami_release]
    end
  end

  ami_hash.each do |version, info|
    info['amis'].each do |region, ids|
      unless ids[virt].nil?
        unless ids[virt][type].nil?
          mappings do
            official_amis do
              camel_keys_set!(:auto_disable)
              set!(region) do
                set!(version, ids[virt][type])
              end
            end
          end
        end
      end
    end
  end
end
