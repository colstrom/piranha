function create-bucket --argument name
    if empty "$name"
        usage create-bucket '<name>'
        return (false)
    end

    print-status create-bucket $name
    set --local options

    has region buckets/$name
    and set -- options $options --create-bucket-configuration LocationConstraint=(get buckets/$name/region)

    has acl buckets/$name
    and set -- options $options --acl (get buckets/$name/acl)

    aws s3api create-bucket --bucket $name $options
end
