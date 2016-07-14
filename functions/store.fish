function store --argument key
    trace (status --current-filename) $argv

    if empty $key
        usage store '<key>' '[value]'
        return 23
    end

    set value (rest $argv)

    mkdir -p (dirname $key)

    if empty $value
        cat >$key
    else
        echo $value | store $key
        print --tag=store $argv --(state $status)
    end

end
