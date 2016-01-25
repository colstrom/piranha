function generate-password
    set --local length (aws iam get-account-password-policy | jq --raw-output .PasswordPolicy.MinimumPasswordLength)
    set --local requirements (password-requirements)

    set --local password
    while test -z "$password"
        set password (env LC_CTYPE=C tr -c -d (echo $requirements | tr -d \n) < /dev/urandom | fold -w $length | head -n 1)
        for requirement in $requirements
            if not echo $password | grep -q [$requirement]
                if set --query DEBUG
                    echo "Candidate $password does not contain $requirement" >& 2
                end

                set password ''

                break
            end
        end
    end
    echo "$password"
end
