function real-buckets
    aws s3api list-buckets | jq --raw-output .Buckets[].Name
end
