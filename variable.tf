variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaabel3fz2ynjylfcbh7gmjdup3agt3vpcwa76hwxfzzi7ikqxbcbvq"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaayjdgt4uffudbq2vvt7q5dtjvfcqvdwqsvh6itfxa225bh7zb5cya"
}

variable "fingerprint" {
  default = "fa:6e:45:d5:7c:d8:80:b8:c3:d3:12:bc:c7:f2:e3:c4"
}

variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaage4q7uwi2fr5btnztngq5qvjf4a5k6524ladsodlcwrynwldlzea"
}

variable "region" {
  default = "ap-mumbai-1"
}

variable "image_ocid" {
  default="ocid1.instance.oc1.ap-mumbai-1.anrg6ljr42xg36acb4lvifvjcuggsezj3xjwysqtgvj5p5uehv5t2eocqwsa"
}

variable "path_local_public_key" {
  default = "/home/opc/.ssh/id_rsa.pub"
  sensitive = true  
}

variable "private_key_path" {
  default = "/home/opc/.oci/keygen.pem"
}
