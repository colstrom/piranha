function add-tag-to-vpc --argument resource key value
    trace (status --current-filename) $argv

    if empty "$resource" "$key" "$value"
        usage add-tag-to-vpc '<vpc-id>' '<key>' '<value>'
        return (false)
    end

    aws ec2 create-tags --resources $resource --tags Key=$key,Value=$value
    print $argv --tag=add-tag-to-vpc --(state $status)
end
