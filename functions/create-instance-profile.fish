function create-instance-profile --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-instance-profile '<name>'
        return (false)
    end

    if not instance-profile-exists $name
        aws iam create-instance-profile --instance-profile-name $name
    end
end
