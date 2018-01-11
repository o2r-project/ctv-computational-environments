## CRAN Task View: Computational Environments and Reproducibility

|                 |                                                             |
| --------------- | ----------------------------------------------------------- |
| **Maintainer:** | Daniel Nüst                                                 |
| **Contact:**    | daniel.nuest at uni-muenster.de                             |
| **Version:**    | 2018-01-11                                                  |
| **URL:**        | <https://CRAN.R-project.org/view=ComputationalEnvironments> |

<div>

*Do not edit this README by hand. See [CONTRIBUTING.md](CONTRIBUTING.md).*

This Task View contains information about controlling and documenting computational environments in R. The base version of R does not provide features to manage different version of R or collections of packages easily, so a number of approaches and packages exist to simplify computational environments for the sake of development, testing, bug-fixing, and reproducibility. The [ReproducibleResearch Task View](https://cran.r-project.org/view=ReproducibleResearch) provides further discussion of packages around scientific reproducibility.

If you have any comments or suggestions for additions or improvements for this Task View, go to GitHub and [submit an issue](https://github.com/o2r-project/ctv-computational-environments/issues), or make some changes and [submit a pull request](https://github.com/o2r-project/ctv-computational-environments/pulls). If you can’t contribute on GitHub, [send Daniel an email](mailto:daniel.nuest@uni-muenster.de). If you have an issue with one of the packages discussed below, please contact the maintainer of that package.

## Virtual Machines and Containers

**Virtual machines** (VMs) are a straightforward way to encapsulate your runtime environment around the actual data and code.

> *In computing, a virtual machine (VM) is an emulation of a computer system. Virtual machines are based on computer architectures and provide functionality of a physical computer.* <https://en.wikipedia.org/wiki/Virtual_machine>

Their advantage for many users is the provided visual user interface. [VirtualBox](https://www.virtualbox.org/) is a Free and Open Source (FOSS) virtualization product you can install on most operating systems (OS), then known as the “host” OS, and supports a number of [“guest” operating systems](https://www.virtualbox.org/wiki/Guest_OSes), many of which can install and run R just like on a non-virtual OS. VMs must be booted like regular OS and have a virtual disk, which you can archive or share with collaborators (though having to handle the large file size). VMs can share directories, network, and other devices with their host.

[**Containers**](https://en.wikipedia.org/wiki/Linux_containers) are an effective way to apply virtual environments at the system level. Compared to [virtual machines](#virtual-machines) their most important advantage for controlled computational environments are performance and transparency. Containers share the hosts core libraries and can “boot” within milliseconds and have negligible computational overhead. They can be created with the help of scripts or “recipes”, which are simple text files. These recipes can be included in code repositories and easily shared online.

The most widespread container solution is **[Docker](https://docker.com)** . It is available for recent and common operating systems. *Dockerfiles* are the recipes that can be built to *Docker images* , which can be run and become *Docker containers* . Using Docker requires some proficiency with a [command line interface](https://en.wikipedia.org/wiki/Command-line_interface) (CLI). The [Docker Hub](http://hub.docker.com/) is an image repository with a large number of pre-built images for different use cases.

### Rocker

The [**Rocker** project](http://rocker-project.org/) provides a number of Docker [images for R](https://www.rocker-project.org/images/), including the [official](https://docs.docker.com/docker-hub/official_repos/) [`r-base`](https://hub.docker.com/_/r-base/) image. All Rocker images are available on the Docker Hub. Rocker images are a stable and widespread tool for running R in local and cloud environments and have established useful best practices around containers with R.

*Since images can extend existing ones, using a suitable Rocker image as a base for your own computations is a very good approach to control your computational environment.* The simplest way is to run the `rocker/rstudio` container and work with the [RStudio IDE](https://www.rstudio.com/products/rstudio/) in your web browser.

**Bioconductor** provides a [collection of images](http://bioconductor.org/help/docker/) based on `rocker/rstudio`.

### Other R distributions

Docker images for other than the “regular” R distribution are available on Docker Hub, though none at the level of maturity and features of Rocker.

  - [one](http://cran.rstudio.com/web/packages/one/index.html) is …

### Tools for working with Containers

**Docker**

  - [`harbor`](https://github.com/wch/harbor/) (not on CRAN) provides all Docker commands with R functions. It may be used to control Docker containers that run either locally or remotely.
  - [docker](http://cran.rstudio.com/web/packages/docker/index.html) (source code [on GitHub](https://github.com/bhaskarvk/docker)) is an alternative to the plain R `harbor` and provides Docker CLI commands using the [Docker SDK for Python](https://docker-py.readthedocs.io/en/stable/) via the package [`reticulate`](https://rstudio.github.io/reticulate/) and consequently runs on various operating systems (including Windows). The package is best suited for apt Docker users, i.e. if you know the Docker commands and life cycle.
  - [`dockermachine`](https://github.com/cboettig/dockermachine) (not on CRAN) provides a convenient R interface to the [`docker-machine`](https://docs.docker.com/machine/overview/) command, so you can provision easily local or remote/cloud instances of containers.
  - [analogsea](https://github.com/sckott/analogsea) is a general purpose client for the Digital Ocean v2 API. In addition, the package includes functions to install various R tools including base R, RStudio server, and more. There’s an improving interface to interact with docker on your remote droplets via this package.
  - [`rize`](https://github.com/cole-brokamp/rize) dockerises [Shiny](https://shiny.rstudio.com/) applications.

## Package management

…

## Templates and workflows

…

</div>

### CRAN packages:

  - [core](http://cran.rstudio.com/web/packages/core/index.html)

### Related links:

  - [ReproducibleResearch TaskView](https://cran.r-project.org/view=ReproducibleResearch)
