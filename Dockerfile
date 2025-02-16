# Use ROS Humble base image
FROM ros:humble-ros-base

# Define arguments for user creation
ARG USERNAME=robotics-user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a non-root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the new user
USER $USERNAME

# Allow access to video devices (e.g., webcams)
RUN sudo usermod --append --groups video $USERNAME

# Update and install essential dependencies
RUN sudo apt update && sudo apt upgrade -y && sudo apt install -y git

# Initialize rosdep
RUN rosdep update

# Source ROS setup script on login
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# Set working directory
WORKDIR /home/$USERNAME

# Default command: start a bash shell
CMD ["/bin/bash"]
