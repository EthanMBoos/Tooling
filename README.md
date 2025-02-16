# RoboticsEnvironmentConfiguration
A practical walkthrough for setting up a robotics project. This guide covers system-level configuration using VirtualBox and Docker to help you get started with a clean, structured development environment.

## Install and Configure VirtualBox
Suppose you're starting a project that requires a specific operating system environment. Although you might be running the latest version of Ubuntu on your development machine, robotics projects often depend on stable, well-tested releases due to slower package upgrade cycles. For example, you will most likely need to work with Ubuntu 22.04 to ensure compatibility with certain robotics packages.

The simplest way to create a development environment is by using [VirtualBox](https://www.geeksforgeeks.org/how-to-install-virtualbox-on-windows/) to create a virtual machine on top of your current operating system. With VirtualBox, you can simulate the entire operating system, allowing your development environment to closely mirror the physical robot system where your code will eventually run.

Once VirtualBox is installed, download your target system release from the [Ubuntu website](https://releases.ubuntu.com/jammy/), in VirtualBox follow the new VM install GUI interface instructions, and run the following commands,
```
# System updates & remove unused packages
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# (If needed) Add your user to gain sudo command access
sudo adduser yourusername
sudo usermod -aG sudo yourusername

# Install Git
sudo apt install git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Github SSH Key Setup
ssh-keygen -t ed25519 -C "your.email@example.com"
# Add ssh key to ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
# Copy ssh key to keyboard
cat ~/.ssh/id_ed25519.pub
# Paste the key into GitHub/GitLab/Bitbucket under SSH keys.

# Docker Install
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER  # Allow non-root use
```
### Networking Suprises!
Networking is one of the unexpected challenges in robotics development. Robots require precise IP configurations, routing, and wireless setups. For a deeper conceptual dive, check out [Networking for Robots: A Crash Course](https://www.robotsforroboticists.com/networking-robots-crash-course/).

Follow this guide for [Key networking setup when using Virtualbox](https://serverfault.com/questions/225155/virtualbox-how-to-set-up-networking-so-both-host-and-guest-can-access-internet).

Key Commands:
```
# After your VirtualBox networking is setup, you should see your new network interface.
ip a

# From VirtualBox Ubuntu VM, check network connection to host machine.
ping <host machine ip address>

# From Host Machine, check network connection to VirtualBox Ubuntu VM.
ping <Ubuntu vm ip address>
```
## Package Your Dependencies In Docker
During the early stages of development, it’s often more efficient to compile and build your projects directly on the host machine (i.e., "bare metal"). This approach simplifies debugging and rapid iteration. Once your codebase stabilizes, you can package it into a Docker container for consistent builds, easier sharing, and smoother deployment in production environments. 

Dockerfile explanation
Include template
Initialization and push to registry
Pull down from registry, build, and run
