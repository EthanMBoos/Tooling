# WalkTheCLI
A practical walkthrough for setting up a project using essential CLI commands. This guide covers Linux, Git, and Docker commands to help you get started with a clean, structured development environment.

### Setting the Stage
Suppose you're starting a robotics project that requires a specific operating system environment. Although you might be running the latest version of Ubuntu on your development machine, robotics projects often depend on stable, well-tested releases due to slower package upgrade cycles. For example, you will most likely need to work with Ubuntu 22.04 to ensure compatibility with certain robotics packages.

### Simulating the Target Environment
The simplest way to create this environment is by using [VirtualBox’s GUI installation tool](https://www.geeksforgeeks.org/how-to-install-virtualbox-on-windows/). With VirtualBox, you can simulate the entire operating system, allowing your development environment to closely mirror the physical robot system where your code will eventually run.

### Development Workflow
During the early stages of development, it’s often more efficient to compile and build your projects directly on the host machine (i.e., "bare metal"). This approach simplifies debugging and rapid iteration. Once your codebase stabilizes, you can package it into a Docker container for consistent builds, easier sharing, and smoother deployment in production environments. 

# Linux

# Git

# Docker
