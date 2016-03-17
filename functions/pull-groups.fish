function pull-groups
    print-status pull-groups

    mkdir -p groups

    for group in (real-groups)
        print-status pull-groups $group
        touch groups/$group
    end
end
