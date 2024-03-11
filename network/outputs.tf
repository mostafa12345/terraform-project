output vpc_id{
    value= aws_vpc.iti_vpc.id
}

output public_subnet_id{
    value= aws_subnet.public1_iti.id
}

output private_subnet_id{
    value= aws_subnet.private1_iti.id
}
