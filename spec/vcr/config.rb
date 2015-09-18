require 'aws-sdk'
require 'vcr'

# See https://ruby.awsblog.com/post/Tx116N5YWW4WJ8I/Faster-AWS-Tests-with-VCR

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :fakeweb
end

# Fixes a missing attribute in Fakeweb's stubbed HTTP client
class FakeWeb::StubSocket; attr_accessor :read_timeout end
VCR.use_cassette('image_upload') do
  # Perform some network transfer
  Net::HTTP.get_response(URI('http://aws.amazon.com/'))
end