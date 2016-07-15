function import-groups
    trace (status --current-filename) $argv

    mkdir -p groups

    for group in (real-groups)
        touch groups/$group
        print $group --tag=import-groups --(state $status)
    end

    print $argv --tag=import-groups --(state $status)
end
