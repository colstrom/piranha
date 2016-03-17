function bucket-exists --argument name
    if empty "$name"
        usage bucket-exists '<name>'
        return (false)
    end

    print-status s3/bucket-exists $name
    aws s3api list-buckets | jq -e ".Buckets[] | select(.Name == \"$name\")" > /dev/null ^ /dev/null
end
