# Ubuntu Server Configuration

This portion of the lab focused on Linux server administration using Ubuntu Server alongside the existing Windows environment.

The Ubuntu virtual machine, `LAB-UBUNTU01`, was configured for remote administration, user and group management, file permissions, and service management.

## Initial Configuration

Ubuntu Server was installed as a virtual machine within VMware.

The initial setup included:

- Ubuntu Server installation
- OpenSSH Server
- Network configuration
- System package updates
- Local user configuration

After installation, system packages were updated using:

```bash
sudo apt update
sudo apt upgrade -y
```

## SSH Remote Administration

OpenSSH Server was installed to allow the server to be managed remotely from other systems.

SSH connectivity was tested using:

```bash
ssh username@server-ip
```

This allowed the server to be administered remotely through the command line rather than directly through the VMware console.

## SSH Key Authentication

SSH key-based authentication was configured to provide secure remote authentication without relying solely on a user password.

An Ed25519 public and private key pair was generated on the client system.

The private key remains on the client while the public key was added to the Ubuntu server's `authorized_keys` file.

After configuration, SSH access was tested to verify that the client could successfully authenticate using the key pair.

## Users and Groups

A Linux group named `appadmins` was created to manage access to application-related resources.

A separate user account was created and added to `appadmins` along with the administrator account.

Group membership was verified using:

```bash
getent group appadmins
```

Using a group for access control allows permissions to be assigned based on a user's role instead of managing permissions separately for each individual account.

## File Ownership and Permissions

A dedicated application directory was created at:

`/srv/labapp`

The directory was configured with `root` as the owner and `appadmins` as the group.

```bash
sudo mkdir -p /srv/labapp
sudo chown root:appadmins /srv/labapp
sudo chmod 775 /srv/labapp
```

The configuration was verified using:

```bash
ls -ld /srv/labapp
```

The `775` permissions allow the owner and members of `appadmins` to read, write, and access the directory while other users are limited to read and execute permissions.

## Service Management

A systemd service was configured to provide hands-on experience managing Linux services.

The service was configured to start through systemd and was managed using standard `systemctl` commands.

Service status and operation were verified using:

```bash
sudo systemctl start labapp
sudo systemctl status labapp
sudo systemctl enable labapp
```

This provided practice with starting, monitoring, and configuring Linux services to run automatically at system startup.

## Skills Practiced

- Ubuntu Server administration
- SSH remote administration
- SSH key authentication
- Linux package management
- Linux users and groups
- File ownership and permissions
- Group-based access control
- systemd
- Linux service management
