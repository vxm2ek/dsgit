#!/Library/Frameworks/Python.framework/Versions/3.11/bin/python3

import boto3
import requests

bucket = 'lab4eva'
object = 'minion.gif'
file_url = 'https://cdn-images-1.medium.com/fit/t/1600/480/1*AmI9wRbXrfIWGESx6eEiTw.gif'
expires = 604800

response = requests.get(file_url)
if response.status_code == 200:
	with open(object, 'wb') as f:
		f.write(response.content)
	print(f"Downloaded {object}")

s3 = boto3.client('s3', region_name='us-east-1')

with open(object, "rb") as f:
	s3.put_object(
        	Body=f,
        	Bucket=bucket,
        	Key=object,
        	ACL='private'
	)
print(f"Uploaded {object} to S3 bucket {bucket}")

presigned_url = s3.generate_presigned_url(
	'get_object',
	Params={'Bucket': bucket, 'Key':object},
	ExpiresIn=expires
)

print(f"Presigned URL: {presigned_url}")
