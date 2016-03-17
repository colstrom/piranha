function users-without-mfa
    comm -13 (users-with-mfa | psub) (get users | psub)
end
