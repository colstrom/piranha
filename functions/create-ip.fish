function create-ip
    aws ec2 allocate-address --domain vpc
end
