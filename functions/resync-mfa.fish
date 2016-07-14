function resync-mfa --argument user first second
    trace (status --current-filename) $argv

    if empty "$user" "$first" "$second"
        usage resync-mfa '<user>' '<first>' '<second>'
        return (false)
    end

    aws iam resync-mfa-device --user-name $user --serial-number (mfa-serial $user) --authentication-code-1 $first --authentication-code-2 $second
end
