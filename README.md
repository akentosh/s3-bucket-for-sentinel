# Example TF to create an S3 bucket

This is an example to show Sentinel with Terraform in the most basic of sense. The important bits are that we stop the public bucket from ever being deployed. Lambda is great or cloud custodian however the resources get created before they are then shut down.


**Change acl from public-read to private to pass sentinel test.**
