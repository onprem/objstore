// Copyright (c) The Thanos Authors.
// Licensed under the Apache License 2.0.

package s3_test

import (
	"bytes"
	"context"
	"strings"
	"testing"

	"github.com/efficientgo/e2e"
	e2edb "github.com/efficientgo/e2e/db"
	"github.com/efficientgo/tools/core/pkg/testutil"
	"github.com/go-kit/kit/log"

	"github.com/thanos-io/objstore/s3"
)

// Regression benchmark for https://github.com/thanos-io/thanos/issues/3917.
func BenchmarkUpload(b *testing.B) {
	b.ReportAllocs()
	ctx := context.Background()

	e, err := e2e.NewDockerEnvironment("e2e_bench_mino_client")
	testutil.Ok(b, err)
	b.Cleanup(e.Close)

	const bucket = "benchmark"
	m := e2edb.NewMinio(e, "benchmark", bucket)
	testutil.Ok(b, e2e.StartAndWaitReady(m))

	bkt, err := s3.NewBucketWithConfig(log.NewNopLogger(), s3.Config{
		Bucket:    bucket,
		AccessKey: e2edb.MinioAccessKey,
		SecretKey: e2edb.MinioSecretKey,
		Endpoint:  m.Endpoint("http"),
		Insecure:  true,
	}, "test-feed")
	testutil.Ok(b, err)

	buf := bytes.Buffer{}
	buf.Grow(1028 * 1028 * 100) // 100MB.
	word := "abcdefghij"
	for i := 0; i < buf.Cap()/len(word); i++ {
		_, _ = buf.WriteString(word)
	}
	str := buf.String()

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		testutil.Ok(b, bkt.Upload(ctx, "test", strings.NewReader(str)))
	}
}
