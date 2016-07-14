function vpc-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage vpc-exists '<name>'
        return (false)
    end

    print-status vpc/exists $name
    test (count (lookup vpc Name $name)) -gt 0
end
