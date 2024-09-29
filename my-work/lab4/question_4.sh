#!/Users/rebeccavanni/anaconda3/bin/python3

import boto3
import urllib.request
import os

s3 = boto3.client('s3', region_name='us-east-1')

bucket_name = 'ds2022-ecn2wh'
local_file = 'ds2022-ecn2wh/tj.meme.png'  # Local path to save the file
object_name = "meme"  # S3 object name
expires_in = 604800  # 7 days in seconds
file_url = "https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif"  # Example direct file URL

os.makedirs(os.path.dirname(local_file), exist_ok=True)
urllib.request.urlretrieve(file_url, local_file)

with open(local_file, 'rb') as data:
    resp = s3.put_object(
        Body=data,  # File content
        Bucket=bucket_name,
        ACL="public-read",
        Key=object_name
    )

response = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket_name, 'Key': object_name},
    ExpiresIn=expires_in
)

print(f"Presigned URL: {response}")

# Presigned URL: https://ds2022-ecn2wh.s3.amazonaws.com/meme?AWSAccessKeyId=AKIA6IY35QTWKVWTQEXT&Signature=%2B8iHqS17rVgIUzBjXVLBiBIfIX8%3D&Expires=1728234792

