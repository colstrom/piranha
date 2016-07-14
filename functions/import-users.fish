function import-users
    trace (status --current-filename) $argv

    mkdir -p users

    for user in (real-users)
        touch users/$user
        print $user --tag=import-users --(state $status)
    end

    print $argv --tag=import-users --(state $status)
end
