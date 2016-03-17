function pull-users
    print-status pull-users

    mkdir -p users

    for user in (real-users)
        print-status pull-users $user
        touch users/$user
    end
end
