#
# Cookbook Name:: elasticsearch-for-aws


elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type :package
end

elasticsearch_configure 'elasticsearch' do
    allocated_memory '256m'
    configuration ({
        'node.name' => 'AWSNode'
    })
end

elasticsearch_service 'elasticsearch' do
  service_actions [:enable, :start]
end

elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
  notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
end
