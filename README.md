# Jenkins Installation Script

This script automates the installation of **Jenkins** on a **Debian/Ubuntu-based system**. It installs Java (OpenJDK 11), adds the Jenkins repository, and installs Jenkins along with configuring the necessary services.

---

## **Prerequisites**

- **Root User** or **Sudo Privileges** required.
- Internet connection to download necessary packages.
- A **Debian/Ubuntu-based system**.

---

## **Features**

- **System Update**: Updates the system packages (`apt update && apt upgrade`).
- **Java Installation**: Installs **OpenJDK 11**.
- **Jenkins Repository**: Adds the Jenkins repository and GPG key.
- **Jenkins Installation**: Installs Jenkins from the official Jenkins repository.
- **Service Setup**: Starts and enables Jenkins to run on system startup.
- **Initial Admin Password**: Fetches and displays the initial admin password required for Jenkins setup.

---

## **How to Use the Script**

### 1. **Create the Script File**

Create a new file called `install_jenkins.sh` using `nano` or your preferred text editor.

```bash
nano install_jenkins.sh

