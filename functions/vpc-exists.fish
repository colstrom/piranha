function vpc-exists --argument name
    print-status vpc/exists $name
    test (count (lookup vpc Name $name)) -gt 0
end
