function create-ip
    trace (status --current-filename) $argv

    aws ec2 allocate-address --domain vpc
end
