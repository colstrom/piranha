function delete-security-group --argument id
    trace (status --current-filename) $argv

    if empty $id
        usage delete-security-group '<id>'
        return 23
    end

    if security-group is-default $id
        return
    else
        switch $id
            case 'sg-*'
                aws ec2 delete-security-group --group-id $id
            case '*'
                aws ec2 delete-security-group --group-name $id
        end
    end
end
