variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaanx6isnx5ktyvk46e4pnnmyuxi27bsewnaf3rrkri2pva7zjqzzta"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaan73tkw4m7yty4xw575wnow3u7gmu4hl2q6lix25yxddfbywm5eda"
}

variable "fingerprint" {
  default = "fa:6e:45:d5:7c:d8:80:b8:c3:d3:12:bc:c7:f2:e3:c4"
}

variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaatmzxsdcsqh65mxf6rqk6oiey2l67x5sdmt5s25auhtog6kgcva7a"
}

variable "region" {
  default = "ap-mumbai-1"
}

variable "image_ocid" {
  default="ocid1.image.oc1.ap-mumbai-1.aaaaaaaafdhnwn64wnw3c2v4xabp6jgwtvvvdz6ypqpeyz36kqxmr3fdcuta"
}

variable "path_local_public_key" {
  default = "/home/opc/.ssh/id_rsa.pub"
  sensitive = true  
}

variable "private_key_path" {
  default = "/home/opc/.oci/keygen.pem"
}
