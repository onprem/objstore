module github.com/efficientgo/objstore

go 1.15

replace (
	// TODO: Remove this: https://github.com/thanos-io/thanos/issues/3967.
	github.com/minio/minio-go/v7 => github.com/bwplotka/minio-go/v7 v7.0.11-0.20210324165441-f9927e5255a6
	// Make sure Prometheus version is pinned as Prometheus semver does not include Go APIs.
	github.com/prometheus/prometheus => github.com/prometheus/prometheus v1.8.2-0.20210914090109-37468d88dce8
)

require (
	cloud.google.com/go/storage v1.10.0
	github.com/Azure/azure-pipeline-go v0.2.3
	github.com/Azure/azure-storage-blob-go v0.13.0
	github.com/Azure/go-autorest/autorest/adal v0.9.15
	github.com/Azure/go-autorest/autorest/azure/auth v0.5.8
	github.com/aliyun/aliyun-oss-go-sdk v2.0.4+incompatible
	github.com/baidubce/bce-sdk-go v0.9.81
	github.com/efficientgo/e2e v0.11.1
	github.com/efficientgo/tools/core v0.0.0-20210829154005-c7bad8450208
	github.com/go-kit/kit v0.11.0
	github.com/minio/minio-go/v7 v7.0.10
	github.com/ncw/swift v1.0.52
	github.com/opentracing/opentracing-go v1.2.0
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.11.0
	github.com/prometheus/common v0.30.0
	github.com/tencentyun/cos-go-sdk-v5 v0.7.31
	github.com/thanos-io/thanos v0.23.1
	golang.org/x/oauth2 v0.0.0-20210819190943-2bc19b11175f
	google.golang.org/api v0.56.0
	gopkg.in/yaml.v2 v2.4.0
)
