# Use the official RStudio image
FROM rocker/rstudio:4.4.3

# Install system dependencies commonly used for R packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    zlib1g-dev \
    libtiff5-dev \
    libicu-dev \
    pandoc \
    git \
    wget \
    curl \
    sudo \
    cmake \
    libgmp-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('renv', repos = 'https://packagemanager.posit.co/cran/__linux__/manylinux_2_28/latest')"
