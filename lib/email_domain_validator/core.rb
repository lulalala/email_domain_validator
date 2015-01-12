class EmailDomainValidator::Core
  def valid?(domain)
    Resolv::DNS.open do |dns|
      return dns.getresources(domain, Resolv::DNS::Resource::IN::MX).size > 0 ||
             dns.getresources(domain, Resolv::DNS::Resource::IN::A).size > 0
    end
  end
end
