function create-security-group --argument name vpc description
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-security-group '<name>' '[vpc]' '[description]'
        return 23
    end

    if empty $description
        set description $name
    end

    if empty $vpc
        aws ec2 create-security-group --group-name $name --description $description | jq --raw-output .SecurityGroups[].GroupId//empty
    else
        if security-group exists $name $vpc
            print --warning Security Group $name already exists in $vpc
        else
            aws ec2 create-security-group --vpc-id $vpc --group-name $name --description $description | jq --raw-output .GroupId//empty
        end
    end
end
