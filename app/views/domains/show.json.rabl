object @domain
attributes :id, :name, :type

child :records => :records do
  attributes :id, :name, :type, :content, :ttl, :prio
end
