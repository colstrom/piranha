function update-instance-profiles
    trace (status --current-filename) $argv

    for profile in (get instance-profiles)
        create-instance-profile $profile

        for role in (get instance-profiles/$profile/roles)
            aws iam add-role-to-instance-profile --instance-profile-name $profile --role-name $role
        end
    end
end
