require 'yaml'
data = YAML.load_file "config/aws.yml"
akey = data["AWS_ACCESS_KEY_ID"]
skey = data["AWS_SECRET_ACCESS_KEY"]
S3BUCKET = data["S3_BUCKET"]

Aws.config.update({
  region: 'ap-southeast-2',
  credentials: Aws::Credentials.new(akey, skey),
})

S3 = Aws::S3::Client.new
S3_BUCKET = Aws::S3::Resource.new.bucket(S3BUCKET)
PRESIGNER = Aws::S3::Presigner.new(client: S3)

