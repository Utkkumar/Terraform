terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "4.100.0"
    }
  }
}
provider "oci"  {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  region           = var.region
  private_key_path = var.private_key_path
  
}

#Step-1 Create Root Compartment
resource "oci_identity_compartment" "my-root_compartment" {
    description = "This is a Root Compartment"
    name = "My_Root_compartment"
}

#Step-2 Create Child Compartment
resource "oci_identity_compartment" "my-test_compartment" {
    #Required
    compartment_id = oci_identity_compartment.my-root_compartment.id
    description = "This compartment is for testing"
    name = "My_compartment"
}

#Step-3 Create DRG 
resource "oci_core_drg" "my-test_drg" {
    #Required
    compartment_id = oci_identity_compartment.my-test_compartment.id
    display_name = "Demo_Drg"
}

#Step-4 Create VCN
resource "oci_core_vcn" "my-test_vcn" {
    #Required
    compartment_id = oci_identity_compartment.my-test_compartment.id
    cidr_block = "10.0.0.0/16"
    display_name = "Demo_vcn"
}

#Step-5 Connect VCN with DRG
resource "oci_core_drg_attachment" "drg_to_vcn_attachment" {
    #Required
    drg_id = oci_core_drg.my-test_drg.id
    vcn_id = oci_core_vcn.my-test_vcn.id
}

##Step-6 Create Subnet for VCN
resource "oci_core_subnet" "my-test_subnet" {
    #Required
    cidr_block = "10.0.1.0/24"
    compartment_id = oci_identity_compartment.my-test_compartment.id
    vcn_id = oci_core_vcn.my-test_vcn.id
    display_name = "example_subnet"
    route_table_id = "${oci_core_vcn.my-test_vcn.default_route_table_id}"
}    

resource "oci_core_instance" "Demo_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "ejUh:AP-MUMBAI-1-AD-1"
	compartment_id = oci_identity_compartment.my-test_compartment.id
	create_vnic_details {
		assign_private_dns_record = "false"
		assign_public_ip = "true"
		subnet_id = oci_core_subnet.my-test_subnet.id
	}
	display_name = "Demo_instance"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	shape = "VM.Standard.E2.1.Micro"
	source_details {
		source_id = var.image_ocid
		source_type = "image"
	}
}
}


#resource "oci_core_instance" "test_instance" {
    #Required
    #availability_domain = var.availability_domain
    #compartment_id = oci_identity_compartment.my-test_compartment.id
    #shape = "VM.Standard.E2.1.Micro"
    #source_details {
        #Required
        #source_id = oci_core_image.test_image.id
        #source_type = "image"
#}
#}

#resource "oci_core_image" "test_image" {
    #Required
    #compartment_id = oci_identity_compartment.my-test_compartment.id
    #instance_id = oci_core_instance.test_instance.id
#}

#resource "oci_core_drg" "test_drg" {
    #Required
    #compartment_id = var.compartment_id
#}
#}
