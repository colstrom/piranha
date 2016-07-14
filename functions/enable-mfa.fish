function enable-mfa --argument user code1 code2
    trace (status --current-filename) $argv

    if empty "$user" "$code1" "$code2"
        usage enable-mfa '<user>' '<code-1>' '<code-2>'
        return (false)
    end

    print-status enable-mfa "$argv"

    if not mfa-enabled $user
        aws iam enable-mfa-device --user-name $user --serial-number (mfa-serial $user) --authentication-code-1 $code1 --authentication-code-2 $code2
    end
end
