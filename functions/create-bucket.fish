function create-bucket --argument-names name
    print-status s3/create-bucket $name
    set --local options

    has region s3/buckets/$name
    and set -- options $options --create-bucket-configuration LocationConstraint=(get s3/buckets/$name/region)

    aws s3api create-bucket --bucket $name $options
end
