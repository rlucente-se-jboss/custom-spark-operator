# Customer Spark Operator
This small project covers how to create a custom
spark operator based on the [radanalytics spark operator](https://github.com/radanalyticsio/spark-operator).

## Install required tooling
On RHEL 8 as root, install the following tooling:

    yum -y module install container-tools
    yum -y install git make maven java-1.8.0-openjdk-devel podman-docker

## Modify the spark-operator
Clone the spark-operator source code using:

    git clone https://github.com/radanalyticsio/spark-operator.git

Edit the spark-operator project and add additional dependencies to the
pom.xml file.  For third party jars, you'll need to import them into
the local maven repository following the guide [here](https://maven.apache.org/guides/mini/guide-3rd-party-jars-local.html).

Finally, run the command to build the container:

    make

## Examine the built jars
Confirm that the desired dependency is in the generated jar file using
the command:

    buildah unshare ./examine-container.sh

## Clean up
To remove everything, simply run:

    rm -fr spark-operator
    podman rmi -f --all

