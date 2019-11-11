# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"
  config.vm.define "bionic64"
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network :forwarded_port, guest: 80, host: 80      # Web
  (3000..3100).map { |port| config.vm.network "forwarded_port", guest: port, host: port }
  # selenium
  config.vm.network "forwarded_port", guest: 4444, host: 4444
  # clipboard
  config.vm.network "forwarded_port", guest: 1234, host: 1234

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  # config.vm.network "forwarded_port", guest: 8080, host: 8080
  # config.vm.network :forwarded_port, guest: 3306, host: 3306  # MySQL
  # config.vm.network :forwarded_port, guest: 5432, host: 5432  # Postgres

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./projects", "/home/vagrant/projects"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    # Customize the amount of memory on the VM:
    vb.name = "Main"
    vb.cpus = 2
    vb.memory = "8192"
    vb.customize ['modifyvm', :id,
      "--clipboard", "bidirectional", # クリップボードの共有
      "--draganddrop", "bidirectional", # ドラッグアンドドロップ可能に
    ]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    login vagrant
    sudo update
    sudo apt install -y make \
                        build-essential \
                        libssl-dev \
                        zlib1g-dev \
                        libbz2-dev \
                        libreadline-dev \
                        libsqlite3-dev \
                        wget \
                        curl \
                        llvm \
                        libncurses5-dev \
                        libncursesw5-dev \
                        xz-utils \
                        tk-dev \
                        libffi-dev \
                        liblzma-dev \
                        python-openssl \
                        git \
                        zsh \
                        xsel \
                        postgresql-client \
                        pgcli
                        autoconf \
                        bison \
                        build-essential \
                        libyaml-dev \
                        libreadline6-dev \
                        libgdbm5 \
                        libgdbm-dev
                        gcc-6 \
                        g++-6 \
                        libssl1.0-dev \
                        libpq-dev \
                        libmagickwand-dev \
                        apt-transport-https \
                        ca-certificates \
                        software-properties-common

    # docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo gpasswd -a vagrant docker
    sudo chmod 666 /var/run/docker.sock
    sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod 0755 /usr/local/bin/docker-compose

    # zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    # pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    # rbenv
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    # nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | zsh
    # git-secrets
    git git clone https://github.com/awslabs/git-secrets.git ~/.git-secrets
    cd .git-secrets && sudo make install
    git secrets --install ~/.git-templates/git-secrets
    git config --global init.templatedir '~/.git-templates/git-secrets'

    # ---------- localでエラーがでたら、これを試す ---------- #
    # locale-gen en_US.UTF-8
    # export LANGUAGE=en_US.UTF-8
    # export LANG=en_US.UTF-8
    # export LC_ALL=en_US.UTF-8
    # locale-gen en_US.UTF-8
    # dpkg-reconfigure locales
    # ---------- localでエラーがでたら、これを試す ---------- #
  SHELL
end
