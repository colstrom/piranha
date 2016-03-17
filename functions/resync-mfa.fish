function resync-mfa --argument user first second
    if empty "$user" "$first" "$second"
        usage resync-mfa '<user>' '<first>' '<second>'
        return (false)
    end

    aws iam resync-mfa-device --user-name $user --serial-number (mfa-serial $user) --authentication-code-1 $first --authentication-code-2 $second
end
