function keys-for-secret --argument key
    trace (status --current-filename) $argv

    if empty $key
        usage keys-for-secret '<key>'
        return 23
    end

    if is-secret $key
        get $key | gpg --batch --list-packets --quiet | string match ":pubkey *" | awk '{ print $NF }'
    else
        false
    end
end
