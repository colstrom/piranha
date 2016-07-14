function vpc-exists --argument name
    trace (status --current-filename) $argv

    print $argv --tag=vpc-exists

    if empty "$name"
        usage vpc-exists '<name>'
        return (false)
    end

    test (count (lookup vpc Name $name)) -gt 0
end
