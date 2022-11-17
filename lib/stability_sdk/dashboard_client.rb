require "grpc"
require "dashboard_services_pb"

module StabilitySDK
  class DashboardClient
    DEFAULT_API_HOST = "grpc.stability.ai:443"

    def initialize(options={})
      host = options[:api_host] || DEFAULT_API_HOST
      channel_creds = options.has_key?(:ca_cert) ? GRPC::Core::ChannelCredentials.new(options[:ca_cert]) : GRPC::Core::ChannelCredentials.new
      call_creds = GRPC::Core::CallCredentials.new(proc { { "authorization" => "Bearer #{options[:api_key]}" } })
      creds = channel_creds.compose(call_creds)

      stub_params = {}
      [:channel_override, :timeout, :propagate_mask, :channel_args, :interceptors].each do |kw|
        stub_params[kw] = options[kw] if options.has_key?(kw)
      end

      @stub = Gooseai::DashboardService::Stub.new(host, creds, **stub_params)
    end

    def get_me
      @stub.get_me(Gooseai::EmptyRequest.new)
    end

    def get_organization
      me = self.get_me
      @stub.get_organization(Gooseai::GetChargesRequest.new(organization_id: me.organizations[0].organization.id))
    end
  end
end
