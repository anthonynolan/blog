aws s3 cp ./html/ s3://blog.cathalanddad.com/html --recursive
aws cloudfront create-invalidation --distribution-id E1PGDI3DG3VVR3 --paths "/*"
