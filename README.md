# count-count.index-null_provider
This repo contains code that contains the count argument and shows how to use it

## What does the null_provider and resource do

The null provider is used to test you code. It is used instead of the cloud providers and is spmething you can do locally on your machine. It provides a way to test the outcome of the code without any consequences.

## What is does the count argument do

By using count you can specify how many time the code for a resource should be executed.
if you are creating a resource this will create the number of resourcer the count is equal to.
`count=2` will create 2 resources

## What does the count.index variable do

Count index will put a number of the interation of each resource creaton after the name of the resource starting from zero
i.e. `null_resource.example[0],null_resource.example[1]`

## What this code does

This specific code example creates two null resources specified by the `count=2` argumnet and for each one of them executes a provisioner `local-exec` which executes a command locally on the pc you are running the code on. The command itself is a linux command echo which return to the screen the text `Hello World` but with the count index at the end.

## Why you need to run this code

You need to run this code the get an overview of how count and count.index works and how you could apply it in what you are doing

## How to use the code in this repo

 * Install Terraform
 ```
 https://www.terraform.io/downloads.html
 ```
 
 * Clone this repository
 ```
 git clone https://github.com/yordanivh/count-count.index-null_provider.git
 ```
 
 * Change directory
 ```
 cd count-count.index-null_provider
 ```
 
 * Initialize the project ( Terraform will download provider plugins)
 
 ```
 terraform init
 ```
 
 * Plan the operation so that you see what actions will taken
 
 ```
 terraform plan
 ```
 
 * Run Terraform apply to create the resources
 ```
 terraform apply
 ```

* To destroy the created resources

 ```
 terraform destroy
 ```

## Sample output
## What is expected

1. Standard output of the init command
```
count-count.index-null_provider (newbranch) $ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
2. Running plan command gives a plan of action - it will create two instances.
```
count-count.index-null_provider (newbranch) $ terraform  plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.example[0] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example[1] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
3. Apply will perform the action.You can see that the "Hello World" text is shown twice with the count index
```
count-count.index-null_provider (newbranch) $ terraform  apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.example[0] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example[1] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.example[1]: Creating...
null_resource.example[0]: Creating...
null_resource.example[1]: Provisioning with 'local-exec'...
null_resource.example[0]: Provisioning with 'local-exec'...
null_resource.example[0] (local-exec): Executing: ["/bin/sh" "-c" "echo \"Hello World0\""]
null_resource.example[1] (local-exec): Executing: ["/bin/sh" "-c" "echo \"Hello World1\""]
null_resource.example[0] (local-exec): Hello World0
null_resource.example[0]: Creation complete after 0s [id=4105835883013644582]
null_resource.example[1] (local-exec): Hello World1
null_resource.example[1]: Creation complete after 0s [id=6510128953493095337]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
5 Destroy command cleans the two instances.
```
count-count.index-null_provider (newbranch) $ terraform destroy
null_resource.example[1]: Refreshing state... [id=6510128953493095337]
null_resource.example[0]: Refreshing state... [id=4105835883013644582]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.example[0] will be destroyed
  - resource "null_resource" "example" {
      - id = "4105835883013644582" -> null
    }

  # null_resource.example[1] will be destroyed
  - resource "null_resource" "example" {
      - id = "6510128953493095337" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.example[1]: Destroying... [id=6510128953493095337]
null_resource.example[0]: Destroying... [id=4105835883013644582]
null_resource.example[1]: Destruction complete after 0s
null_resource.example[0]: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```





