# Works for Me!

An annoying phrase that can take ages to fix. Some code works on one developer's
machine, then when their collaborator attempts to run it, it doesn't. Sometimes
development machines can be messy in terms of installed packages (`apt-get`,
`pip`, or otherwise), their versions, or differences in networking.

Using the magic of a virtual machine (VM), we can solve most of those problems.
While we could download Oracle's VirtualBox, then download an installation CD
of our favorite OS, then spend an hour setting it up in a little window, there
is a better way.

Vagrant allows us to script the provisioning (setup) of a VM so we don't need
to do anything beyond type `vagrant up` and go get a cup of coffee.

## Host Requirements

* Oracle VirtualBox
* Vagrant

### Additional Windows Requirements

Not strictly required, but extremely convenient:

* An SSH client that's on your `PATH`.

## Variants

### Ubuntu with Python

## Instructions for Use

1. Install the requirements listed above.

1. Select the environment you would like to use.

1. Copy the `Vagrantfile` and other files into your project directory.

1. Edit the files to add packages that you require. For example, add Python
packages that you're using to `requirements.txt`, or install additional packages
in `vagrant_provision.sh`. (View the README in the variant folder for further
detail)

1. In the root of your project, the folder with the `Vagrantfile`, run the
command `vagrant up`. Vagrant will download the VM image, then provision it
using the `vagrant_provision.sh` script.

1. `vagrant ssh` to connect to the machine. Your project root will be mounted
at `/vagrant` inside the VM
