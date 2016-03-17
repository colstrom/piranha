function users-with-mfa
    aws iam list-virtual-mfa-devices | jq --raw-output .VirtualMFADevices[].User.UserName//empty
end
