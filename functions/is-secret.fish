function is-secret --argument key
    trace (status --current-filename) $argv

    if has (basename $key) (dirname $key)
        set secret_header '-----BEGIN PGP MESSAGE-----'
        set header (head -n 1 $key ^/dev/null)

        test "$header" = "$secret_header"
    else
        false
    end
end
