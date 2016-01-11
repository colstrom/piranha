function update-vpcs
    for name in (get vpcs)
        set vpc (lookup vpc $name)

        vpc-exists $name
        or set vpc (create-vpc)
        and begin
            add-tag-to-vpc $vpc Name $name

            for tag in (get vpcs/$name/tags)
                add-tag-to-vpc $vpc $tag (get vpcs/$name/tags/$tag)
            end
        end
    end
end
