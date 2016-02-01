function update-buckets
    for bucket in (get s3/buckets)
        bucket-exists $bucket
        or create-bucket $bucket
        and for policy in (get s3/buckets/$bucket/policies)
            apply-policy s3/buckets/$bucket/policies/$policy
        end
    end
end
