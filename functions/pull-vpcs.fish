function pull-vpcs
    trace (status --current-filename) $argv

    print-status pull-vpcs

    mkdir -p vpcs

    for vpc in (real-vpcs)
        print-status pull-vpcs $vpc
        touch vpcs/$vpc
    end
end
