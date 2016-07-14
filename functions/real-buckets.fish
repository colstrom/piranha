function real-buckets
    trace (status --current-filename) $argv

    aws s3api list-buckets | jq --raw-output .Buckets[].Name
end
