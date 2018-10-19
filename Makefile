build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://futuresarcade.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2C3B58KOMG2NS --paths '/*'
