function ami --argument distribution release
    trace (status --current-filename) $argv

    switch "$distribution"
        case ubuntu
            switch "$release"
                case 16.04 xenial lts
                    aws ec2 describe-images --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*" | jq -r '.Images | sort_by(.CreationDate) [] | select(.OwnerId == "099720109477") | .ImageId' | tail -1
                case 14.04 trusty
                    aws ec2 describe-images --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*" | jq -r '.Images | sort_by(.CreationDate) [] | select(.OwnerId == "099720109477") | .ImageId' | tail -1
                case 12.04 precise
                    aws ec2 describe-images --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-precise-12.04-amd64-server-*" | jq -r '.Images | sort_by(.CreationDate) [] | select(.OwnerId == "099720109477") | .ImageId' | tail -1
            end
    end
end
