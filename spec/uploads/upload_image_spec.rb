describe 'Uploading files to S3' do
  let(:s3) { AWS::S3.new }
  let(:bucket) { s3.buckets['test-uploads'] }
  before { s3.buckets.create(bucket.name) }

  it 'uploads multiple files to S3 and reads them out' do
    # Uploads items
    25.times do |i|
      bucket.objects["file#{i}.jpg"].write("DATA")
    end

    # Reads items back
    25.times do |i|
      bucket.objects["file#{i}.jpg"].read.should == "DATA"
    end
  end
end