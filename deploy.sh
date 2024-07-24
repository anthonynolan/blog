git add .
git commit -m 'blog entry'
git push
aws s3 cp ./output/ s3://blog.cathalanddad.com/ --recursive
aws cloudfront create-invalidation --distribution-id E1PGDI3DG3VVR3 --paths "/*"
