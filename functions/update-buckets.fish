function update-buckets
    trace (status --current-filename) $argv

    for bucket in (get buckets)
        bucket-exists $bucket
        or create-bucket $bucket
        and for policy in (get buckets/$bucket/policies)
            apply-policy buckets/$bucket/policies/$policy
        end
    end
end
