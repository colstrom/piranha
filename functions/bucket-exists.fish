function bucket-exists --argument name
    print-status s3/bucket-exists $name
    aws s3api list-buckets | jq -e ".Buckets[] | select(.Name == \"$name\")" > /dev/null ^ /dev/null
end
