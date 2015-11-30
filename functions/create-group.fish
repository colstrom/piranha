function create-group --argument-names name
  print-status iam/create-group $name
  aws iam create-group --group-name $name
end
