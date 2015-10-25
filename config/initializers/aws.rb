require 'yaml'
data = YAML.load_file "config/aws.yml"
akey = data["AWS_ACCESS_KEY_ID"]
skey = data["AWS_SECRET_ACCESS_KEY"]
s3bucket = data["S3_BUCKET"]

Aws.config.update({
  region: 'ap-southeast-2',
  credentials: Aws::Credentials.new(akey, skey),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(s3bucket)
