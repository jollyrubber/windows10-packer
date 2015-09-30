# windows10-packer

A packer project focused on building a Vagrant box of Windows 10.
Based on [joefitzgerald/packer-windows](https://github.com/joefitzgerald/packer-windows)

## Download ISO

Download thew Windows 10 Enterprise Evaluation ISO.
A script called `download.ps1` is located in the iso folder as a convenience.
Run this if you are on a Windows host.

## Building Base Box

This project has a Packer template to build a VirtualBox Vagrant base box.

You will need to install

* [Packer 0.8.x](https://www.packer.io)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

```bash
$ packer build template.json
```

## Running

Building the base box should of created a file called `windows10.virtualbox.box`.
You need to add that to Vagrant. Then you can call `vagrant up` using the `Vagrantfile` included in this project.

You will need to install

* [Vagrant](https://www.vagrantup.com/downloads.html)

```bash
vagrant box add windows10.virtualbox.box --name windows10
vagrant up
```

## Windows Assessment & Deployment Kit (ADK)

The Windows ADK contains many useful tools, among which you'll find the System Image Manager (SIM).
You can used this to customize the `Autounattended.xml` file. Although you can edit the file manually,
the SIM will give you better insight into the features and settings available to the Windows version
you are working with. Learn more at https://msdn.microsoft.com/en-us/windows/hardware/dn913721(v=vs.8.5).aspx.
