*Do not edit this README by hand. See [CONTRIBUTING.md](CONTRIBUTING.md).*

This Task View contains information about controlling and documenting computational environments in R. The base version of R does not provide features to manage different version of R or collections of packages easily, so a number of approaches and packages exist to simplify computational environments for the sake of development, testing, bug-fixing, and reproducibility. The [ReproducibleResearch Task View](https://cran.r-project.org/view=ReproducibleResearch) provides further discussion of packages around scientific reproducibility.

If you have any comments or suggestions for additions or improvements for this Task View, go to GitHub and [submit an issue](https://github.com/o2r-project/ctv-computational-environments/issues), or make some changes and [submit a pull request](https://github.com/o2r-project/ctv-computational-environments/pulls). If you can't contribute on GitHub, [send Daniel an email](mailto:daniel.nuest@uni-muenster.de). If you have an issue with one of the packages discussed below, please contact the maintainer of that package.

## Virtual Machines and Containers

**Virtual machines** (VMs) are a straightforward way to encapsulate your runtime environment around the actual data and code. 

> _In computing, a virtual machine (VM) is an emulation of a computer system. Virtual machines are based on computer architectures and provide functionality of a physical computer._ [https://en.wikipedia.org/wiki/Virtual_machine](https://en.wikipedia.org/wiki/Virtual_machine)

Their advantage for many users is the provided visual user interface.
[VirtualBox](https://www.virtualbox.org/) is a Free and Open Source (FOSS) virtualization product you can install on most operating systems (OS), then known as the "host" OS, and supports a number of ["guest" operating systems](https://www.virtualbox.org/wiki/Guest_OSes), many of which can install and run R just like on a non-virtual OS.
VMs must be booted like regular OS and have a virtual disk, which you can archive or share with collaborators (though having to handle the large file size).
VMs can share directories, network, and other devices with their host.

[**Containers**](https://en.wikipedia.org/wiki/Linux_containers) are an effective way to apply virtual environments at the system level.
Compared to [virtual machines](#virtual-machines) their most important advantage for controlled computational environments are performance and transparency.
Containers share the hosts core libraries and can "boot" within milliseconds and have negligible computational overhead.
They can be created with the help of scripts or "recipes", which are simple text files.
These recipes can be included in code repositories and easily shared online.

The most widespread container solution is **[Docker](https://docker.com)**.
It is available for recent and common operating systems.
_Dockerfiles_ are the recipes that can be built to _Docker images_, which can be run and become _Docker containers_.
Using Docker requires some proficiency with a [command line interface](https://en.wikipedia.org/wiki/Command-line_interface) (CLI).
The [Docker Hub](http://hub.docker.com/) is an image repository with a large number of pre-built images for different use cases.

### Rocker

The [**Rocker** project](http://rocker-project.org/) provides a number of Docker [images for R](https://www.rocker-project.org/images/), including the [official](https://docs.docker.com/docker-hub/official_repos/) [`r-base`](https://hub.docker.com/_/r-base/) image.
All Rocker images are available on the Docker Hub.
Rocker images are a stable and widespread tool for running R in local and cloud environments and have established useful best practices around containers with R.

**Bioconductor** provides a [collection of images](http://bioconductor.org/help/docker/) based on `rocker/rstudio`.

_Since images can extend existing ones, using a suitable Rocker image as a base for your own computations is a very good approach to control your computational environment._
The simplest way is to run the `rocker/rstudio` container and work with the [RStudio IDE](https://www.rstudio.com/products/rstudio/) in your web browser.
Alternatively, you can develop your analysis on your computer and "package" it in a container only when preparing for a software release of scientific publication.

### Other R distributions and operating systems 

Docker images for other than the "regular" R distribution and the [Debian](https://www.debian.org)-based Rocker images are available on Docker Hub, though none at the level of maturity and features of Rocker.

- **[MRO](https://mran.microsoft.com/open)** images are available as an independent contribution (i.e. not by MRO team) on Docker Hub, [`nuest/mro`](https://hub.docker.com/r/nuest/mro/), and as CentOS-based Dockerfiles on GitHub, [`jlisic/R-docker-centos`](https://github.com/jlisic/R-docker-centos).
- [Renjin](http://www.renjin.org/about.html) images are available as an independent contribution on Docker Hub as [`nuest/renjin`](https://hub.docker.com/r/nuest/renjin/)
- [pqR](http://www.pqr-project.org/) images are available as an independent contribution on Docker Hub as [`nuest/pqr`](https://hub.docker.com/r/nuest/pqr/)

### Tools for working with containers

**Docker**

- [`harbor`](https://github.com/wch/harbor/) (not on CRAN) provides all Docker commands with R functions. It may be used to control Docker containers that run either locally or remotely.
- <pkg>docker</pkg> is an alternative to the plain R `harbor` and provides Docker CLI commands using the [Docker SDK for Python](https://docker-py.readthedocs.io/en/stable/) via the package [`reticulate`](https://rstudio.github.io/reticulate/) and consequently runs on various operating systems including Windows. The package is best suited for apt Docker users, i.e. if you know the Docker commands and life cycle. Source code is [on GitHub](https://github.com/bhaskarvk/docker).
- [`dockermachine`](https://github.com/cboettig/dockermachine) (not on CRAN) provides a convenient R interface to the [`docker-machine`](https://docs.docker.com/machine/overview/) command, so you can provision easily local or remote/cloud instances of containers.
- <pkg>analogsea</pkg> is a general purpose client for the Digital Ocean v2 API. In addition, the package includes functions to install various R tools including base R, RStudio server, and more. There's an improving interface to interact with docker on your remote droplets via this package. ([GitHub](https://github.com/sckott/analogsea)) 
- [`rize`](https://github.com/cole-brokamp/rize) (not on CRAN) dockerises [Shiny](https://shiny.rstudio.com/) applications.
- [`containerit`](https://github.com/o2r-project/containerit) (not on CRAN) automatically creates Dockerfiles for arbitrary R sessions, script files, or workspace directories.
- [`dockertest`](https://github.com/traitecoevo/dockertest) (not con CRAN) is a proof of concept for using the isolated environments of Docker containers to run tests.
- <pkg>liftr</pkg> partially automates rendering R Markdown documents with Docker by adding YAML-metadata ([example](https://github.com/road2stat/dockflow/blob/master/config/sequencing.yml)), see [http://liftr.me/](http://liftr.me/).
- <pkg>googleComputeEngineR</pkg> ([website](https://cloudyr.github.io/googleComputeEngineR/)) provides an R interface to the Google Cloud Compute Engine API, for example for creating an RStudio VM, also using Docker to configure the environment.
- [**`batchtools`**](https://cran.r-project.org/package=batchtools) ([repository](https://github.com/mllg/batchtools), [JOSS paper](http://dx.doi.org/10.21105/joss.00135)) provides a parallel implementation of [Map](https://en.wikipedia.org/wiki/Map_(parallel_pattern)) for [HPC](https://en.wikipedia.org/wiki/Supercomputer) for different [schedulers](https://en.wikipedia.org/wiki/Job_scheduler), including [Docker Swarm](https://docs.docker.com/engine/swarm/).

## Deployment

Another alternative to share a well-defined computational environment is setting up R on a server.

**Interactive development environments**

- [RStudio Server](https://www.rstudio.com/products/rstudio/#Server)
- [RCloud](http://rcloud.social) ([Docker images](https://hub.docker.com/r/rcl0ud/rcloud/) and [Dockerfile](https://github.com/att/rcloud/tree/master/docker))

**Apps and APIS**

- [ShinyProxy](https://www.shinyproxy.io/) by [Open Analytics](https://www.openanalytics.eu/)
- <pkg>plumber</pkg> ([website](https://www.rplumber.io/) allows creating web services as HTTP APIs in pure R.
- [rApache](http://rapache.net) supports web application development using the [Apache web server](https://httpd.apache.org/).

## Package management

- checkpoint
- rbundler
- packrat
- pkgsnap

## Structure, templates and workflows

A good project structure is essential to be sure about the actually used computational environment, which includes locally defines functions and data and not just used packages or the R version.

- <pkg>here</pkg> constructs paths to a project's files.
- [Ben Marwick's compendium](https://github.com/benmarwick/researchcompendium)
- [rrtools](https://github.com/benmarwick/rrtools)

## Tracking and provenance

A computational environment evolves as an analysis is developed.
These packages help observing these changes, in addition to always recommended [code versioning systems](https://en.wikipedia.org/wiki/Version control systems).

- [`freezer`](https://github.com/ekernf01/freezr) (not on CRAN) helps data analysis by capturing analyses executions including used code, results, and metadata.
- [`recordr`](https://github.com/NCEAS/recordr) (not on CRAN) provides an automated way to capture data provenance of "runs" for R scripts and console commands.
