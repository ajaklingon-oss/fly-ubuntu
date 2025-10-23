# Gunakan image resmi Ubuntu 22.04 (Jammy)
FROM ubuntu:22.04

# Non-interaktif biar build lancar
ENV DEBIAN_FRONTEND=noninteractive

# Update dan install paket dasar
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    vim \
    htop \
    net-tools \
    && apt-get clean

# Buat user "flyuser" dengan password "flypass" (ubah nanti)
RUN useradd -m -s /bin/bash flyuser && echo "flyuser:flypass" | chpasswd && adduser flyuser sudo

# Jalankan SSH server
RUN mkdir /var/run/sshd
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
