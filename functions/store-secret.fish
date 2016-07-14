function store-secret --argument key
    trace (status --current-filename) $argv

    set value (rest $argv)

    if empty "$key" "$value"
        usage store-secret '<key>' '<value>'
        return 23
    end

    set trusted (get config/trusted)

    if empty trusted
        print --failure "No trusted recipients defined in config/trusted"
        return 2
    end

    echo $value | gpg --encrypt --armor --no-comments --recipient $trusted | tee $key
end
