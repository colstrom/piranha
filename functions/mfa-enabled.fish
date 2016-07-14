function mfa-enabled --argument user
    trace (status --current-filename) $argv

    if empty "$user"
        usage mfa-enabled '<user>'
        return (false)
    end

    contains $user (users-with-mfa)
    set enabled $status

    if test $enabled -eq 0
        print --tag=mfa-enabled --pass $argv
    else
        print --tag=mfa-enabled --fail $argv
    end

    return $enabled
end
