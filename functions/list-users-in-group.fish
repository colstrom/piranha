function list-users-in-group --argument-names group
    print-status iam/list-users-in-group $group
    test -f iam/group/$group.list
    and cat iam/group/$group.list
end
